//
//  HomeContentView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/5.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

private let kContentCellID = "kContentCellID"

protocol HomeContentViewDelegate : class {
    func contentView(_ contentView : HomeContentView, targetIndex : Int)
    func contentView(_ contentView : HomeContentView, targetIndex : Int, progress : CGFloat)
}

class HomeContentView: UIView {

    weak var delegate: HomeContentViewDelegate?
    
    fileprivate var titles: [HomeTopTitle]
    fileprivate var childVcs: [HomeTopViewController]
    fileprivate var parentVc: UIViewController
    
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var isForbidScroll: Bool = false
    
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kContentCellID)
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    init(frame: CGRect, titles: [HomeTopTitle], childVcs: [HomeTopViewController], parentVc: UIViewController) {
        self.childVcs = childVcs
        self.parentVc = parentVc
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeContentView {
    fileprivate func setupUI() {
        // 将所有子控制器添加到父控制器中
        for childVc in childVcs {
            parentVc.addChildViewController(childVc)
        }
        // 添加UICollection用于展示内容
        addSubview(collectionView)
    }
}

extension HomeContentView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kContentCellID, for: indexPath)
        
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.homeTopTitle = titles[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}

// MARK:- UICollectionView的delegate
extension HomeContentView : UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        contentEndScroll()
        scrollView.isScrollEnabled = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            contentEndScroll()
        } else {
            scrollView.isScrollEnabled = false
        }
    }
    
    private func contentEndScroll() {
        // 获取滚动到的位置
        let currentIndex = Int(collectionView.contentOffset.x / collectionView.bounds.width)
        // 通知titleView进行调整
        delegate?.contentView(self, targetIndex: currentIndex)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isForbidScroll = false
        
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 0.判断和开始时的偏移量是否一致
        guard startOffsetX != scrollView.contentOffset.x, !isForbidScroll else {
            return
        }
        
        // 1.定义targetIndex/progress
        var targetIndex = 0
        var progress : CGFloat = 0.0
        
        // 2.给targetIndex/progress赋值
        let currentIndex = Int(startOffsetX / scrollView.bounds.width)
        if startOffsetX < scrollView.contentOffset.x { // 左滑动
            targetIndex = currentIndex + 1
            if targetIndex > childVcs.count - 1 {
                targetIndex = childVcs.count - 1
            }
            
            progress = (scrollView.contentOffset.x - startOffsetX) / scrollView.bounds.width
        } else { // 右滑动
            targetIndex = currentIndex - 1
            if targetIndex < 0 {
                targetIndex = 0
            }
            progress = (startOffsetX - scrollView.contentOffset.x) / scrollView.bounds.width
        }
        
        // 通知代理
        delegate?.contentView(self, targetIndex: targetIndex, progress: progress)
    }
}

// MARK:- 遵守HYTitleViewDelegate
extension HomeContentView : HomeTitleViewDelegate {
    func titleView(_ titleView: HomeTitleView, targetIndex: Int) {
        /**
         不加判断会出现下面的问题
         attempt to scroll to invalid index path: <NSIndexPath: 0x15ff9f9e0> {length = 2, path = 0 - 20}'
         */
        if targetIndex < 20 {
        }
        let indexPath = IndexPath(item: targetIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}

