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
    func titleView(titleView: YMTitleView, titleSearchButton button: UIButton)
}

class YMTitleView: UIView {
    
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

    private lazy var titleSearchButton: UIButton = {
        let titleSearchButton = UIButton()
//        titleSearchButton.setBackgroundImage(UIImage(named: "shadow_add_titlebar_new_52x44_"), forState: .Normal)
        titleSearchButton.setImage(UIImage(named: "search_topic_24x24_"), forState: .Normal)
        titleSearchButton.addTarget(self, action: #selector(titleSearchButtonClick(_:)), forControlEvents: .TouchUpInside)
        return titleSearchButton
    }()
    
    private lazy var titleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        let titleCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        titleCollectionView.backgroundColor = UIColor.whiteColor()
        titleCollectionView.delegate = self
        titleCollectionView.dataSource = self
        let nib = UINib(nibName: String(YMVideoCollectionViewCell), bundle: nil)
        titleCollectionView.registerNib(nib, forCellWithReuseIdentifier: videoCollectionViewCellID)
        titleCollectionView.showsHorizontalScrollIndicator = false
        return titleCollectionView
    }()
    
    func titleSearchButtonClick(button: UIButton) {
        delegate?.titleView(self, titleSearchButton: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension YMTitleView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(videoCollectionViewCellID, forIndexPath: indexPath) as! YMVideoCollectionViewCell
        cell.titleLabel.text = "推荐"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
