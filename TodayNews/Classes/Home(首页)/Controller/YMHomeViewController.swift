//
//  YMHomeViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
/// ![首页-1](http://obna9emby.bkt.clouddn.com/news/%E9%A6%96%E9%A1%B5-1_spec.png)
let homeTopicCellID = "YMHomeTopicCell"

class YMHomeViewController: UIViewController {
    // 当前选中的 titleLabel 的 上一个 titleLabel
    var oldIndex: Int = 0
    /// 首页顶部标题
    var homeTitles = [YMHomeTopTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // 有多少条文章更新
        showRefreshTipView()
        // 处理标题的回调
        homeTitleViewCallback()
    }
    
    private func setupUI() {
        view!.backgroundColor = YMGlobalColor()
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        // 设置导航栏属性
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = YMColor(210, g: 63, b: 66, a: 1.0)
        // 设置 titleView
        navigationItem.titleView = titleView
        // 添加滚动视图
        view.addSubview(scrollView)
    }
    
    /// 每次刷新显示的提示标题
    private lazy var tipView: YMTipView = {
        let tipView = YMTipView()
        tipView.frame = CGRectMake(0, 44, SCREENW, 35)
        // 加载 navBar 上面，不会随着 tableView 一起滚动
        self.navigationController?.navigationBar.insertSubview(tipView, atIndex: 0)
        return tipView
    }()
    
    /// 滚动视图
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = UIScreen.mainScreen().bounds
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    /// 顶部标题
    private lazy var titleView: YMScrollTitleView = {
        let titleView = YMScrollTitleView()
        return titleView
    }()
    
    /// 有多少条文章更新
    private func showRefreshTipView() {
        YMNetworkTool.shareNetworkTool.loadArticleRefreshTip { [weak self] (count) in
            self!.tipView.tipLabel.text = (count == 0) ? "暂无更新，请休息一会儿" : "今日头条推荐引擎有\(count)条刷新"
            UIView.animateWithDuration(kAnimationDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: {
                self!.tipView.tipLabel.transform = CGAffineTransformMakeScale(1.1, 1.1)
                }, completion: { (_) in
                    self!.tipView.tipLabel.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue(), {
                        self!.tipView.hidden = true
                    })
            })
        }
    }
    
    /// 处理标题的回调
    private func  homeTitleViewCallback() {
        // 返回标题的数量
        titleView.titleArrayClosure { [weak self] (titleArray) in
            self!.homeTitles = titleArray
            for topTitle in titleArray {
                let topicVC = YMHomeTopicController()
                topicVC.topTitle = topTitle
                self!.addChildViewController(topicVC)
            }
            self!.scrollViewDidEndScrollingAnimation(self!.scrollView)
            self!.scrollView.contentSize = CGSizeMake(SCREENW * CGFloat(titleArray.count), SCREENH)
        }
        
        // 添加按钮点击
        titleView.addButtonClickClosure { [weak self] in
            let addTopicVC = YMAddTopicViewController()
            addTopicVC.myTopics = self!.homeTitles
            let nav = YMNavigationController(rootViewController: addTopicVC)
            self!.presentViewController(nav, animated: false, completion: nil)
        }
        
        // 点击了哪一个 titleLabel，然后 scrolleView 进行相应的偏移
        titleView.didSelectTitleLableClosure { [weak self] (titleLabel) in
            var offset = self!.scrollView.contentOffset
            offset.x = CGFloat(titleLabel.tag) * self!.scrollView.width
            self!.scrollView.setContentOffset(offset, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMHomeViewController: UIScrollViewDelegate {
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    // scrollView 刚开始滑动时
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 记录刚开始拖拽是的 index
        self.oldIndex = index
    }
    
    // scrollView 结束滑动
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 与刚开始拖拽时的 index 进行比较
        // 检查是否需要改变 label 的位置
        titleView.adjustTitleOffSetToCurrentIndex(index, oldIndex: self.oldIndex)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


