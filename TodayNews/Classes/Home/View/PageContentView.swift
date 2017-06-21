//
//  PageContentView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//
//  分页内容
//
import UIKit

class PageContentView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = UIColor.globalBackgroundColor()
        //自适应大小
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        isPagingEnabled = true
    }
    
    class func collectionView(frame: CGRect) -> PageContentView {
        let pageContentViewLayout = PageContentViewLayout()
        return PageContentView(frame: frame, collectionViewLayout: pageContentViewLayout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class PageContentViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
    }
    // 重新布局
    override func prepare() {
        //定义每个UICollectionView 的大小
        itemSize = CGSize(width: screenWidth, height: screenHeight - kNavBarHeight - kTabBarHeight - khomePageTitleHeight)
        //定义每个UICollectionView 横向的间距
        minimumLineSpacing = 0
        //定义每个UICollectionView 纵向的间距
        minimumInteritemSpacing = 0
        //定义 UICollectionView 的边距
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)//上左下右
        // 设置滚动方向
        scrollDirection = .horizontal
        // 隐藏水平方向指示器
        collectionView?.showsHorizontalScrollIndicator = false
        // 设置分页
        collectionView?.isPagingEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
