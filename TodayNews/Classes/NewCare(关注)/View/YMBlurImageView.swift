//
//  YMBlurImageView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/3.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  点击关注界面的某一个 cell 之后，跳转到下移控制器的顶部视图。
//  界面实现不算太难，主要是对每个控件的布局，使用 `SnapKit`。点击按钮的回调使用委托实现。
//

import UIKit
import SnapKit

protocol YMBlurImageViewDelegate: NSObjectProtocol {
    func blurImageView(blurImage: YMBlurImageView, titleButton: UIButton)
    func blurImageView(blurImage: YMBlurImageView, backButton: UIButton)
    func blurImageView(blurImage: YMBlurImageView, coverButton: UIButton)
    func blurImageView(blurImage: YMBlurImageView, shareButton: UIButton)
    func blurImageView(blurImage: YMBlurImageView, careButton: UIButton)
}
/// ![](http://obna9emby.bkt.clouddn.com/care-title.png)
class YMBlurImageView: UIImageView {
    
    weak var delegate: YMBlurImageViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userInteractionEnabled = true
        // 添加毛玻璃效果
        addSubview(blurView)
        // 添加关注图片按钮
        addSubview(avaterImageView)
        // 添加标题
        addSubview(titltButton)
        // 添加关注人数
        addSubview(peopleCountLabel)
        // 添加帖子数量
        addSubview(topicCountLabel)
        // 添加介绍按钮
        addSubview(introduceButton)
        // 添加刷新图片
        addSubview(refreshImageView)
        // 添加覆盖按钮
        addSubview(coverButton)
        // 添加分享按钮
        addSubview(shareButton)
        // 添加关心按钮
        addSubview(careButton)
        // 添加返回按钮
        addSubview(backButton)
        
        coverButton.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(avaterImageView.snp_top).offset(-kMargin)
        }
        
        refreshImageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(backButton.snp_centerY)
            make.size.equalTo(CGSizeMake(20, 20))
            make.centerX.equalTo(self.centerX).offset(titltButton.width)
        }
        
        careButton.snp_makeConstraints { (make) in
            make.right.equalTo(shareButton.snp_left).offset(-kMargin)
            make.centerY.equalTo(backButton.snp_centerY)
            make.size.equalTo(CGSizeMake(53, 30))
        }
        
        shareButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(backButton.snp_centerY)
            make.right.equalTo(self).offset(-kMargin)
        }
        
        introduceButton.snp_makeConstraints { (make) in
            make.left.equalTo(topicCountLabel.snp_right).offset(kMargin)
            make.centerY.equalTo(topicCountLabel.snp_centerY)
        }
        
        topicCountLabel.snp_makeConstraints { (make) in
            make.left.equalTo(peopleCountLabel.snp_right).offset(kMargin)
            make.top.equalTo(peopleCountLabel.snp_top)
        }
        
        peopleCountLabel.snp_makeConstraints { (make) in
            make.left.equalTo(titltButton.snp_left)
            make.bottom.equalTo(avaterImageView.snp_bottom).offset(-5)
        }
        
        titltButton.snp_makeConstraints { (make) in
            make.left.equalTo(avaterImageView.snp_right).offset(kMargin)
            make.top.equalTo(avaterImageView.snp_top).offset(5)
        }
        
        avaterImageView.snp_makeConstraints { (make) in
            make.left.equalTo(backButton)
            make.size.equalTo(CGSizeMake(60, 60))
            make.bottom.equalTo(self.snp_bottom).offset(-15)
        }
        
        backButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(3 * kMargin)
            make.left.equalTo(self).offset(15)
        }
        
        blurView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    // 中心刷新图标
    var refreshImageView: UIImageView = {
        let refreshImageView = UIImageView()
        refreshImageView.image = UIImage(named: "refresh_titlebar_20x20_")
        refreshImageView.alpha = 0
        return refreshImageView
    }()
    
    // 覆盖按钮
    lazy var coverButton: UIButton = {
        let coverButton = UIButton()
        coverButton.addTarget(self, action: #selector(coverButtonClick(_:)), forControlEvents: .TouchUpInside)
        return coverButton
    }()
    
    // 关心按钮
    private lazy var careButton: UIButton = {
        let careButton = UIButton()
        careButton.setTitle("关心", forState: .Normal)
        careButton.setTitle("已关心", forState: .Selected)
        careButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        careButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        careButton.setTitleColor(YMColor(230, g: 230, b: 230, a: 1.0), forState: .Selected)
        careButton.layer.borderColor = UIColor.whiteColor().CGColor
        careButton.layer.borderWidth = 1
        careButton.layer.cornerRadius = kCornerRadius
        careButton.layer.masksToBounds = true
        careButton.addTarget(self, action: #selector(careButtonClick(_:)), forControlEvents: .TouchUpInside)
        return careButton
    }()
    
    // 分享按钮
    private lazy var shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "icon_details_share_24x24_"), forState: .Normal)
        shareButton.setImage(UIImage(named: "icon_details_share_press_24x24_"), forState: .Highlighted)
        shareButton.addTarget(self, action: #selector(shareButtonClick(_:)), forControlEvents: .TouchUpInside)
        return shareButton
    }()
    
    // 介绍按钮
    lazy var introduceButton:  UIButton = {
        let introduceButton = UIButton()
        introduceButton.setTitle("介绍 >", forState: .Normal)
        introduceButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        introduceButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        return introduceButton
    }()
    
    // 帖子数量
    lazy var topicCountLabel: UILabel = {
        let topicCountLabel = UILabel()
        topicCountLabel.text = "1000帖子"
        topicCountLabel.textColor = UIColor.whiteColor()
        topicCountLabel.font = UIFont.systemFontOfSize(14)
        return topicCountLabel
    }()
    
    // 关注人数
    lazy var peopleCountLabel: UILabel = {
        let peopleCountLabel = UILabel()
        peopleCountLabel.text = "5679人关注"
        peopleCountLabel.textColor = UIColor.whiteColor()
        peopleCountLabel.font = UIFont.systemFontOfSize(14)
        return peopleCountLabel
    }()
    
    // 标题
    lazy var titltButton: UIButton = {
        let titltButton = UIButton()
        titltButton.setTitle("# 数码宝贝", forState: .Normal)
        titltButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        titltButton.titleLabel!.font = UIFont.systemFontOfSize(16)
        titltButton.addTarget(self, action: #selector(titltButtonClick(_:)), forControlEvents: .TouchUpInside)
        return titltButton
    }()
    
    // 关注图片
    var avaterImageView: UIImageView = {
        let avaterImageView = UIImageView()
        avaterImageView.image = UIImage(named: "hrscy")
        return avaterImageView
    }()
    
    // 返回按钮
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "white_lefterbackicon_titlebar_28x28_"), forState: .Normal)
        backButton.addTarget(self, action: #selector(backButtonClick(_:)), forControlEvents: .TouchUpInside)
        backButton.sizeToFit()
        return backButton
    }()
    
    // 模糊效果
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()
    
    /// 返回按钮点击
    func backButtonClick(button: UIButton) {
        delegate?.blurImageView(self, backButton: button)
    }
    
    /// 标题按钮点击
    func titltButtonClick(button: UIButton) {
        delegate?.blurImageView(self, titleButton: button)
    }
    
    /// 分享按钮点击
    func shareButtonClick(button: UIButton) {
        delegate?.blurImageView(self, shareButton: button)
    }
    
    /// 关心按钮点击
    func careButtonClick(button: UIButton) {
        button.selected = !button.selected
        delegate?.blurImageView(self, careButton: button)
    }
    
    /// 覆盖按钮点击
    func coverButtonClick(button: UIButton) {
        delegate?.blurImageView(self, coverButton: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
