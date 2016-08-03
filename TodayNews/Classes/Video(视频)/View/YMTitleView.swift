//
//  YMTitleView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/1.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

let videoCollectionViewCellID = "videoCollectionViewCellID"

protocol YMTitleViewDelegate: NSObjectProtocol {
    func titleView(titleView: YMTitleView, titleButton button: UIButton)
}

class YMTitleView: UIView {
    /// 顶部标题数组
    var titles = [YMVideoTopTitle]()
    
    var imageName: String? {
        didSet {
            titleSearchButton.setImage(UIImage(named: imageName!), forState: .Normal)
            
        }
    }
    
    weak var delegate: YMTitleViewDelegate?
    
    class func titleView() -> YMTitleView {
        let frame = CGRectMake(0, 0, SCREENW, 44)
        return YMTitleView(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleCollectionView)
        
        addSubview(titleSearchButton)
        
        titleCollectionView.snp_makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
        }

        titleSearchButton.snp_makeConstraints { (make) in
            make.left.equalTo(titleCollectionView.snp_right)
            make.size.equalTo(CGSizeMake(30, 44))
            make.top.right.bottom.equalTo(self)
        }
        
    }
    
    /// 顶部搜索按钮
    private lazy var titleSearchButton: UIButton = {
        let titleSearchButton = UIButton()
        titleSearchButton.addTarget(self, action: #selector(titleSearchButtonClick(_:)), forControlEvents: .TouchUpInside)
        return titleSearchButton
    }()
    
    /// 顶部 collectionView
    lazy var titleCollectionView: UICollectionView = {
        let layout = YMFlowLayout()
        let titleCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        titleCollectionView.backgroundColor = UIColor.clearColor()
        titleCollectionView.delegate = self
        titleCollectionView.dataSource = self
        let nib = UINib(nibName: String(YMVideoCollectionViewCell), bundle: nil)
        titleCollectionView.registerNib(nib, forCellWithReuseIdentifier: videoCollectionViewCellID)
        return titleCollectionView
    }()
    
    func titleSearchButtonClick(button: UIButton) {
        delegate?.titleView(self, titleButton: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class YMFlowLayout: UICollectionViewFlowLayout {
    /// 准备布局
    private override func prepareLayout() {
        super.prepareLayout()
        // 设置 layout 布局
        scrollDirection = .Horizontal
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        itemSize = CGSizeMake(65, 44)
        // 设置 contentView 属性
        collectionView?.showsHorizontalScrollIndicator = false
    }
}

extension YMTitleView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    /// 人为的拖动会调用
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        // 取出需要显示的控制器
        // 拿到索引
//        let index = Int(scrollView.contentOffset.x / titleCollectionView.width)
        // 设置标题居中
        var offset = titleCollectionView.contentOffset
        // 左边超出处理
        if offset.x < 0 {
            offset.x = 0
        }
        let maxX = titleCollectionView.contentSize.width - titleCollectionView.width
        // 右边超出处理
        if offset.x > maxX {
            offset.x = maxX
        }
        titleCollectionView.setContentOffset(offset, animated: true)
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(videoCollectionViewCellID, forIndexPath: indexPath) as! YMVideoCollectionViewCell
        let topTitle = titles[indexPath.item]
        cell.titleLabel.text = topTitle.name
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
}
