//
//  HomePageView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/5.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class HomePageView: UIView {

    fileprivate var titles: [HomeTopTitle]
    fileprivate var childVcs: [HomeTopViewController]
    fileprivate var parentVc: UIViewController
    fileprivate var style: TitleStyle
    
    fileprivate var titleView: HomeTitleView!
    
    init(frame: CGRect, titles: [HomeTopTitle], childVcs: [HomeTopViewController], parentVc: UIViewController, style: TitleStyle) {
        self.titles = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        self.style = style
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePageView {
    
    fileprivate func setupUI() {
        
        setupTitleView()
        
        setupContentView()
    }
    
    private func setupTitleView() {
        let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleHeight)
        titleView = HomeTitleView(frame: titleFrame, titles: titles, style : style)
        addSubview(titleView)
    }
    
    private func setupContentView() {
        // 取到类型一定是可选类型
        let contentFrame = CGRect(x: 0, y: style.titleHeight, width: bounds.width, height: bounds.height - style.titleHeight)
        let contentView = HomeContentView(frame: contentFrame, titles: titles, childVcs: childVcs, parentVc: parentVc)
        addSubview(contentView)
        contentView.backgroundColor = UIColor.white
        // contentView&titleView代理设置
        titleView.delegate = contentView
        contentView.delegate = titleView as? HomeContentViewDelegate
    }
}
