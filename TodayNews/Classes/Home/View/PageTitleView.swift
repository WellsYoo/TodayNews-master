//
//  pageTitleView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//
import UIKit

class PageTitleView: UIScrollView {
    /// 存放标题模型的数组
    var titles = [HomeTopTitle]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// 获取标题数据
        NetworkTool.loadHomeTitlesData { (topTitles) in
            // 添加推荐标题
            let dict = ["category": "__all__", "name": "推荐"]
            let recommend = HomeTopTitle(dict: dict as [String : AnyObject])
            self.titles.append(recommend)
            self.titles += topTitles
            // 添加视图
            self.setupUI()
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    // 设置视图
    fileprivate func setupUI() {
        
    }
}

private class HomeTitleLabel: UILabel {
    /// 用来记录当前 label 的缩放比例
    var currentScale: CGFloat = 1.0 {
        didSet {
            transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
        }
    }
}
