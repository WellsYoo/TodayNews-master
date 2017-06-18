//
//  VideoViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hsrcy. All rights reserved.
//
// 2.视频 控制器

import UIKit

class VideoViewController: UIViewController {
    // 当前选中的 titleLabel 的 上一个 titleLabel
    var oldIndex: Int = 0
    
    var titles = [VideoTopTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    fileprivate lazy var pageContentView: PageContentView = {
        let pageContentView = PageContentView.collectionView(frame: CGRect.zero)
        pageContentView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "VideoViewCell")
        pageContentView.delegate = self
        pageContentView.dataSource = self
        return pageContentView
    }()
    
    fileprivate lazy var titleView: VideoTitleView = {
        let titleView = VideoTitleView()
        titleView.delegate = self
        return titleView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - setupUI
extension VideoViewController {
    // 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.titleView = titleView
        
        view.addSubview(pageContentView)
        
        pageContentView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view.snp.top).offset(kNavBarHeight)
            make.bottom.equalTo(view.snp.bottom).offset(-kTabBarHeight)
        }
        
        titleView.videoTitleArrayClosure { (titleArray) in
            self.titles = titleArray
            self.pageContentView.reloadData()
//            self.scrollViewDidEndScrollingAnimation(self.pageContentView)
        }
    }
}

// MARK: - VideoTitleViewDelegate
extension VideoViewController: VideoTitleViewDelegate {
    /// VideoTitleViewDelegate
    func videoTitle(videoTitle: VideoTitleView, didClickSearchButton searchButton: UIButton) {
        print("点击了搜索按钮")
    }
    
    func videoTitle(videoTitle: VideoTitleView, didSelectVideoTitleLable titleLabel: TitleLabel) {
        var offset = self.pageContentView.contentOffset
        offset.x = CGFloat(titleLabel.tag) * self.pageContentView.width
        self.pageContentView.setContentOffset(offset, animated: true)
    }
}

// MARK: - UIScrollViewDelegate
extension VideoViewController: UIScrollViewDelegate {
    /// UIScrollViewDelegate
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        // 当前索引
//        let index = Int(scrollView.contentOffset.x / screenWidth)
//        
//    }
//    // scrollView 刚开始滑动时
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        // 当前索引
//        let index = Int(scrollView.contentOffset.x / screenWidth)
////        // 记录刚开始拖拽是的 index
//        self.oldIndex = index
//    }
    
    // scrollView 结束滑动
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        scrollViewDidEndScrollingAnimation(scrollView)
//        // 当前索引
//        let index = Int(scrollView.contentOffset.x / screenWidth)
//        // 与刚开始拖拽时的 index 进行比较
//        // 检查是否需要改变 label 的位置
//        titleView.adjustVideoTitleOffSetToCurrentIndex(currentIndex: index, oldIndex: self.oldIndex)
//    }
}

// MARK: - UICollectionViewDataSource
extension VideoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoViewCell", for: indexPath)
        let topVC = VideoTopicController()
        topVC.videoTitle = titles[indexPath.item]
        cell.contentView.addSubview(topVC.view)
        topVC.view.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(cell)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: screenWidth, height: screenHeight - kNavBarHeight - kTabBarHeight)
    }
}
