//
//  YMVideoViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMVideoViewController: UIViewController {
    // 当前选中的 titleLabel 的 上一个 titleLabel
    var oldIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    // 设置 UI
    private func setupUI() {
        view!.backgroundColor = YMGlobalColor()
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.titleView = titleView
        view.addSubview(scrollView)
        // 搜索按钮点击
        titleView.searchButtonClickClosure { [weak self] in
            let videoSearchVC = YMVideoSearchController()
            self!.navigationController?.pushViewController(videoSearchVC, animated: true)
        }
        
        // 返回视频标题的数量
        titleView.videoTitleArrayClosure { [weak self] (titleArray) in
            for topic in titleArray {
                let topicVC = YMVideoTopicController()
                topicVC.title = topic.name
                self!.addChildViewController(topicVC)
            }
            self!.scrollViewDidEndScrollingAnimation(self!.scrollView)
            self!.scrollView.contentSize = CGSizeMake(SCREENW * CGFloat(titleArray.count), SCREENH)
        }
        
        /// 点击了哪一个 titleLabel，然后 scrolleView 进行相应 的偏移
        titleView.didSelectVideoTitleLableClosure { [weak self] (titleLabel) in
            var offset = self!.scrollView.contentOffset
            offset.x = CGFloat(titleLabel.tag) * self!.scrollView.width
            self!.scrollView.setContentOffset(offset, animated: true)
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
    
    private lazy var titleView: YMVideoTitleView = {
        let titleView = YMVideoTitleView()
        return titleView
    }()
}

extension YMVideoViewController: UIScrollViewDelegate {
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
        titleView.adjustVideoTitleOffSetToCurrentIndex(index, oldIndex: self.oldIndex)
    }
}
