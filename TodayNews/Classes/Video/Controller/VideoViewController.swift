//
//  VideoViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hsrcy. All rights reserved.
//
// 2.视频 控制器

import UIKit

class VideoViewController: UIViewController, UIScrollViewDelegate, VideoTitleViewDelegate {
    // 当前选中的 titleLabel 的 上一个 titleLabel
    var oldIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // 设置 UI
    private func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.titleView = titleView
        
        view.addSubview(scrollView)
        
        titleView.videoTitleArrayClosure { (titleArray) in
            for videoTopic in titleArray {
                let videoTopicVC = VideoTopicController()
                videoTopicVC.videoTitle = videoTopic
                self.addChildViewController(videoTopicVC)
            }
            self.scrollViewDidEndScrollingAnimation(scrollView: self.scrollView)
            self.scrollView.contentSize = CGSize(width: screenWidth * CGFloat(titleArray.count), height: screenHeight)
        }
    }
    
    private lazy var titleView: VideoTitleView = {
        let titleView = VideoTitleView()
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = UIScreen.main.bounds
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    /// VideoTitleViewDelegate
    func videoTitle(videoTitle: VideoTitleView, didClickSearchButton searchButton: UIButton) {
        print("点击了搜索按钮")
    }
    
    func videoTitle(videoTitle: VideoTitleView, didSelectVideoTitleLable titleLabel: TitleLabel) {
        var offset = self.scrollView.contentOffset
        offset.x = CGFloat(titleLabel.tag) * self.scrollView.width
        self.scrollView.setContentOffset(offset, animated: true)
    }
    
    /// UIScrollViewDelegate
    private func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
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
    private func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 记录刚开始拖拽是的 index
        self.oldIndex = index
    }
    
    // scrollView 结束滑动
    private func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView: scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 与刚开始拖拽时的 index 进行比较
        // 检查是否需要改变 label 的位置
        titleView.adjustVideoTitleOffSetToCurrentIndex(currentIndex: index, oldIndex: self.oldIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
