//
//  PageView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//
import UIKit
import SnapKit

let buttonW: CGFloat = 39

protocol PageViewDelegate {
    /// 右侧按钮点击
    func pageViewRightButtonClicked()
}

class PageView: UIView {
    
    var delegate: PageViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleScrollView: PageTitleView = {
        let titleScrollView = PageTitleView()
        return titleScrollView
    }()
    
    // 懒加载 右侧按钮
    fileprivate lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "add_channel_titlbar_thin_new_16x16_"), for: .normal)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return rightButton
    }()
    
    lazy var pageContentView: PageContentView = {
        let pageContentView = PageContentView.collectionView(frame: CGRect.zero)
        pageContentView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "homeTopicViewCell")
        return pageContentView
    }()
    
    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.globalBackgroundColor()
        return bottomView
    }()
    
}

extension PageView {
    /// 添加相关视图
    fileprivate func setupUI() {
        
        backgroundColor = UIColor.white
        
        // 添加 标题 视图
        addSubview(titleScrollView)
        // 添加 右侧 『+』 按钮
        addSubview(rightButton)
        // 添加 内容 视图
        addSubview(pageContentView)
        
        addSubview(bottomView)
        // 布局
        titleScrollView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self)
            make.right.equalTo(rightButton.snp.left)
            make.bottom.equalTo(rightButton.snp.bottom)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.top.right.equalTo(self)
            make.height.equalTo(buttonW)
            make.width.equalTo(buttonW)
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(1)
            make.bottom.equalTo(pageContentView.snp.top)
        }
        
        pageContentView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
        }
    }
    
    /// 右侧按钮点击
    @objc fileprivate func rightButtonClicked() {
        delegate?.pageViewRightButtonClicked()
    }
    
}
