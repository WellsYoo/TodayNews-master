//
//  YMHomeViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let homeTopicCellID = "YMHomeTopicCell"

class YMHomeViewController: UIViewController {
    // 当前选中的 titleLabel 的 上一个 titleLabel
    var oldIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view!.backgroundColor = YMGlobalColor()
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        navigationItem.titleView = titleView
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = YMColor(210, g: 63, b: 66, a: 1.0)
        view.addSubview(scrollView)
        // 添加按钮点击
        titleView.addButtonClickClosure { [weak self] in
            let addTopicVC = YMAddTopicViewController()
            let nav = YMNavigationController(rootViewController: addTopicVC)
            self!.presentViewController(nav, animated: false, completion: nil)
        }
        
        /// 点击了哪一个 titleLabel，然后 scrolleView 进行相应 的偏移
        titleView.didSelectTitleLableClosure { [weak self] (titleLabel) in
            var offset = self!.scrollView.contentOffset
            offset.x = CGFloat(titleLabel.tag) * self!.scrollView.width
            self!.scrollView.setContentOffset(offset, animated: true)
        }
        
        // 返回标题的数量
        titleView.titleArrayClosure { [weak self] (titleArray) in
            for topic in titleArray {
                let topicVC = YMHomeTopicController()
                topicVC.title = topic.name
                self!.addChildViewController(topicVC)
            }
            self!.scrollViewDidEndScrollingAnimation(self!.scrollView)
            self!.scrollView.contentSize = CGSizeMake(SCREENW * CGFloat(titleArray.count), SCREENH)
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = UIScreen.mainScreen().bounds
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 顶部标题
    private lazy var titleView: YMScrollTitleView = {
        let titleView = YMScrollTitleView()
        return titleView
    }()
    
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


