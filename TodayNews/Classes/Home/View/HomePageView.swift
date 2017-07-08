//
//  HomePageView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/5.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

protocol HomePageViewDelegate : class {
    func pageView(_ pageView : HomePageView, targetIndex : Int)
}

class HomePageView: UIView {

    weak var homePageDelegate: HomePageViewDelegate?
    
    fileprivate var oldIndex: Int = 0
    fileprivate var currentIndex: Int = 0
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var isForbidScroll: Bool = false
    
    var titles: [TopicTitle]? {
        didSet {
            titleView.titles = titles
        }
    }
    
    var childVcs: [TopicViewController]? {
        didSet {
            let vc = childVcs![currentIndex]
            vc.view.frame = CGRect(x: 0, y: 0, width: scrollView.width, height: scrollView.height)
            scrollView.addSubview(vc.view)
            
//            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
        
    fileprivate lazy var titleView: HomeTitleView = {
        let titleView = HomeTitleView()
        titleView.delegate = self
        return titleView
    }()
    // 注释掉的代码是使用 collectionView作为容器，利用 collectionViewCell 的重用，但是这种方式会有问题，由于重用造成标题和内容的不匹配
    // 后来使用 scrollView 的方式
//    fileprivate lazy var collectionView : UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: screenWidth, height: screenHeight - kNavBarHeight - 40)
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.scrollDirection = .horizontal
//        
//        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = UIColor.white
//        collectionView.register(UINib(nibName: String(describing: HomeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
//        collectionView.isPagingEnabled = true
//        collectionView.scrollsToTop = false
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePageView {
    
    fileprivate func setupUI() {
        backgroundColor = UIColor.white
        
        addSubview(titleView)
//        addSubview(collectionView)
        addSubview(scrollView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(40)
//            make.bottom.equalTo(collectionView.snp.top)
            make.bottom.equalTo(scrollView.snp.top)
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
        }
//        collectionView.snp.makeConstraints { (make) in
//            make.left.bottom.right.equalTo(self)
//        }
//        homePageDelegate = titleView
    }
}

//extension HomePageView : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.width, height: collectionView.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return childVcs!.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as! HomeCollectionViewCell
////        for subView in cell.contentView.subviews {
////            subView.removeFromSuperview()
////        }
//        let childVc = childVcs![currentIndex]
//        childVc.view.frame = cell.contentView.bounds
//        cell.contentView.addSubview(childVc.view)
//        return cell
//    }
//}

// MARK: - UIScrollViewDelegate
extension HomePageView: UIScrollViewDelegate {
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 取出子控制器
        let vc = childVcs![index]
        vc.view.frame = CGRect(x: scrollView.contentOffset.x, y: 0, width: scrollView.width, height: scrollView.height)
        scrollView.addSubview(vc.view)
    }
    
    // scrollView 刚开始滑动时
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 记录刚开始拖拽是的 index
        oldIndex = index
    }
    
    // scrollView 结束滑动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 与刚开始拖拽时的 index 进行比较
        // 检查是否需要改变 label 的位置
        homePageDelegate?.pageView(self, targetIndex: index)
    }
}

// MARK:- UICollectionView的delegate
//extension HomePageView : UIScrollViewDelegate {
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        contentEndScroll()
//        scrollView.isScrollEnabled = true
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if !decelerate {
//            contentEndScroll()
//        } else {
//            scrollView.isScrollEnabled = false
//        }
//    }
//    
//    private func contentEndScroll() {
//        // 获取滚动到的位置
//        let currentIndex = Int(collectionView.contentOffset.x / collectionView.bounds.width)
//        // 通知titleView进行调整
//        homePageDelegate?.pageView(self, targetIndex: currentIndex)
//    }
//    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        isForbidScroll = false
//        startOffsetX = scrollView.contentOffset.x
//    }
//}

// MARK:- 遵守HYTitleViewDelegate
extension HomePageView : HomeTitleViewDelegate {
    func titleView(_ titleView: HomeTitleView, targetIndex: Int) {
        currentIndex = targetIndex
        let offset = CGPoint(x: screenWidth * CGFloat(targetIndex), y: 0)
        scrollView.setContentOffset(offset, animated: true)

//        let indexPath = IndexPath(item: targetIndex, section: 0)
//        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
