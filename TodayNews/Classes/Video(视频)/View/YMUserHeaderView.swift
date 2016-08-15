//
//  YMUserHeaderView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/14.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  用户顶部 view
//  暂时没有使用

import UIKit
import Kingfisher

/// ![](http://obna9emby.bkt.clouddn.com/news/video-detail-user-header.png)
class YMUserHeaderView: UIView {
    
    var media: YMMediaEntry? {
        didSet {
            let url = media?.icon
            avatarImageView.kf_setImageWithURL(NSURL(string: url!)!)
            avatarImageView.kf_setImageWithURL(NSURL(string: url!)!, placeholderImage: UIImage(named: "home_head_default_29x29_"), optionsInfo: nil, progressBlock: { (receivedSize, totalSize) in
                self.progressView.width = SCREENW * CGFloat(receivedSize / totalSize)
                }) { (image, error, cacheType, imageURL) in
                    self.progressView.hidden = true
            }
            nameLabel.text = media?.name
            introduceLabel.text = media?.describe
            careButton.selected = media!.is_subscribed
        }
    }
    
    /// 返回按钮点击回调
    var backButtonClosure: (()->())?
    /// 关注按钮点击回调
    var careButtonClosure: ((button: UIButton)->())?
    /// 更多按钮点击回调
    var moreButtonClosure: (() -> ())?
    /// 全部按钮点击回调
    var allButtonClosure: (() -> ())?
    /// 视频按钮点击回调
    var videoButtonClosure: (() -> ())?
    
    class func userHeaderView() -> YMUserHeaderView {
        let frame = CGRectMake(0, 0, SCREENW, 278)
        return YMUserHeaderView(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    func setupUI() {
        
        /// 添加头像，昵称，介绍
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(introduceLabel)
        /// 添加底部 view
        addSubview(lineView1)
        addSubview(bottomView)
        addSubview(lineView2)
        /// 添加 全部按钮，视频按钮
        bottomView.addSubview(allButton)
        bottomView.addSubview(videoButton)
        bottomView.addSubview(redView)
        /// 添加顶部View
        addSubview(topView)
        topView.addSubview(progressView)
        /// 添加返回按钮，关注按钮，更多按钮
        addSubview(backButton)
        addSubview(careButton)
        addSubview(moreButton)
        
        progressView.snp_makeConstraints { (make) in
            make.left.equalTo(bottomView)
            make.size.equalTo(CGSizeMake(100, 2))
            make.top.equalTo(topView.snp_top).offset(20)
        }
        
        redView.snp_makeConstraints { (make) in
            make.centerX.equalTo(videoButton)
            make.size.equalTo(CGSizeMake(40, 2))
            make.bottom.equalTo(lineView2.snp_top)
        }
        
        allButton.snp_makeConstraints { (make) in
            make.left.top.bottom.equalTo(bottomView)
            make.right.equalTo(videoButton.snp_left)
            make.width.equalTo(SCREENW * 0.5)
        }
        
        videoButton.snp_makeConstraints { (make) in
            make.right.top.bottom.equalTo(bottomView)
            make.width.equalTo(allButton)
        }
        
        lineView1.snp_makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(klineWidth)
            make.bottom.equalTo(bottomView.snp_top)
        }
        
        bottomView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(44)
            make.top.equalTo(introduceLabel.snp_bottom).offset(kMargin)
        }
        
        lineView2.snp_makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(klineWidth)
            make.top.equalTo(bottomView.snp_bottom)
        }
        
        introduceLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(SCREENW - 40)
            make.top.equalTo(nameLabel.snp_bottom).offset(12)
            make.bottom.equalTo(bottomView.snp_top).offset(-kMargin)
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.height.equalTo(25)
            make.top.equalTo(avatarImageView.snp_bottom).offset(kMargin)
        }
        
        avatarImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.size.equalTo(CGSizeMake(66, 66))
            make.top.equalTo(topView.snp_bottom).offset(20)
        }
        
        topView.snp_makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self).offset(-20)
            make.height.equalTo(64)
        }
        
        backButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(topView).offset(kMargin)
            make.left.equalTo(topView).offset(kHomeMargin)
        }
        
        careButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(backButton)
            make.size.equalTo(CGSizeMake(52, 28))
            make.right.equalTo(moreButton.snp_left).offset(-kMargin)
        }
        
        moreButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(careButton)
            make.right.equalTo(topView.snp_right).offset(-kMargin)
        }
    }
    
    private lazy var progressView: UIView = {
        let progressView = UIView()
        progressView.backgroundColor = YMColor(42, g: 145, b: 215, a: 1.0)
        return progressView
    }()
    
    /// 顶部View
    lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.whiteColor()
        return topView
    }()
    
    /// 返回按钮
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "lefterbackicon_titlebar_28x28_"), forState: .Normal)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backButtonClick), forControlEvents: .TouchUpInside)
        return backButton
    }()
    
    /// 关注按钮
    lazy var careButton: UIButton = {
        let careButton = UIButton()
        careButton.setTitle("关注", forState: .Normal)
        careButton.setTitle("已关注", forState: .Selected)
        careButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        careButton.setTitleColor(UIColor.lightGrayColor(), forState: .Selected)
        careButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        careButton.layer.cornerRadius = kCornerRadius
        careButton.layer.masksToBounds = true
        careButton.layer.borderColor = UIColor.blackColor().CGColor
        careButton.layer.borderWidth = klineWidth
        careButton.addTarget(self, action: #selector(careButtonClick(_:)), forControlEvents: .TouchUpInside)
        return careButton
    }()
    
    /// 更多按钮
    lazy var moreButton: UIButton = {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "new_more_titlebar_28x28_"), forState: .Normal)
        moreButton.sizeToFit()
        moreButton.addTarget(self, action: #selector(moreButtonClick), forControlEvents: .TouchUpInside)
        return moreButton
    }()
    
    /// 头像
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "home_head_default_29x29_")
        avatarImageView.layer.cornerRadius = 33
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        avatarImageView.layer.borderWidth = 0.5
        return avatarImageView
    }()
    
    /// 用户昵称
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFontOfSize(18)
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.textAlignment = .Center
        return nameLabel
    }()
    
    /// 介绍
    private lazy var introduceLabel: UILabel = {
        let introduceLabel = UILabel()
        introduceLabel.numberOfLines = 0
        introduceLabel.font = UIFont.systemFontOfSize(13)
        introduceLabel.textColor = UIColor.lightGrayColor()
        introduceLabel.textAlignment = .Center
        return introduceLabel
    }()
    
    /// 分割线
    private lazy var lineView1: UIView = {
        let lineView1 = UIView()
        lineView1.backgroundColor = YMColor(220, g: 220, b: 220, a: 1.0)
        return lineView1
    }()
    
    /// 底部 View
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        return bottomView
    }()
    
    /// 全部按钮
    lazy var allButton: UIButton = {
        let allButton = UIButton()
        allButton.setTitle("全部", forState: .Normal)
        allButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        allButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        allButton.addTarget(self, action: #selector(allButtonClick(_:)), forControlEvents: .TouchUpInside)
        return allButton
    }()
    
    /// 视频按钮
    lazy var videoButton: UIButton = {
        let videoButton = UIButton()
        videoButton.setTitle("视频", forState: .Normal)
        videoButton.selected = true
        videoButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        videoButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        videoButton.addTarget(self, action: #selector(videoButtonClick(_:)), forControlEvents: .TouchUpInside)
        return videoButton
    }()
    
    /// 红色指示线
    private lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = YMColor(246, g: 68, b: 64, a: 1.0)
        return redView
    }()
    
    /// 分割线
    private lazy var lineView2: UIView = {
        let lineView2 = UIView()
        lineView2.backgroundColor = YMColor(220, g: 220, b: 220, a: 1.0)
        return lineView2
    }()
    
    /// 返回按钮点击
    func backButtonClick() {
        backButtonClosure?()
    }
    
    /// 关注按钮点击
    func careButtonClick(button: UIButton) {
        button.selected = !button.selected
        button.layer.borderColor = button.selected ? UIColor.lightGrayColor().CGColor : UIColor.blackColor().CGColor
        careButtonClosure?(button: button)
    }
    
    /// 更多按钮点击
    func moreButtonClick() {
        moreButtonClosure?()
    }
    
    /// 全部按钮点击
    func allButtonClick(button: UIButton) {
        button.selected = !button.selected
        UIView.animateWithDuration(kAnimationDuration, animations: { 
            self.redView.centerX = button.centerX
            }) { (_) in
                self.allButtonClosure?()
        }
    }
    
    /// 视频按钮点击
    func videoButtonClick(button: UIButton) {
        button.selected = !button.selected
        UIView.animateWithDuration(kAnimationDuration, animations: {
            self.redView.centerX = button.centerX
        }) { (_) in
            self.videoButtonClosure?()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
