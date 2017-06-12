//
//  PageView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import SnapKit

let buttonW: CGFloat = 40
let homeTopIdentifier: String = "homeTopIdentifier"


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
    
    fileprivate lazy var titleScrollView: PageTitleView = {
        let titleScrollView = PageTitleView()
        return titleScrollView
    }()
    
    // 懒加载 右侧按钮
    fileprivate lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "add_channel_titlbar_16x16_"), for: .normal)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return rightButton
    }()
    
    fileprivate lazy var pageContentView: PageContentView = {
        let pageContentView = PageContentView.collectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        pageContentView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: homeTopIdentifier)
        pageContentView.delegate = self
        pageContentView.dataSource = self
        return pageContentView
    }()
}

extension PageView {
    /// 添加相关视图
    fileprivate func setupUI() {
        // 添加 标题 视图
        addSubview(titleScrollView)
        // 添加 右侧 『+』 按钮
        addSubview(rightButton)
        // 添加 内容 视图
        addSubview(pageContentView)
        // 布局
        titleScrollView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self)
            make.right.equalTo(rightButton.snp.left)
            make.bottom.equalTo(pageContentView.snp.top)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.top.right.equalTo(self)
            make.height.equalTo(buttonW)
            make.width.equalTo(buttonW)
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

// MARK: - UICollectionViewDelegate
extension PageView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeTopIdentifier, for: indexPath)
        let topVC = HomeTopViewController()
        cell.contentView.addSubview(topVC.view)
        
        topVC.view.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(cell)
        }
        return cell
    }
}
