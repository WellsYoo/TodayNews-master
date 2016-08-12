//
//  YMHomdeDetailUserView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  新闻详情标题下面的关注用户
//  没有调用
//

import UIKit
import SnapKit
/// ![](http://obna9emby.bkt.clouddn.com/news/home-detail-care.png)
class YMHomdeDetailUserView: UIView {
    
    var newTopic: YMNewsTopic? {
        didSet {
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        
        addSubview(avatarImage)
        
        addSubview(titleLabel)
        
        addSubview(typeButton)
        
        addSubview(timeLabel)
        
        addSubview(careButton)
        
        careButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(72, 29))
            make.right.equalTo(self).offset(-kHomeMargin)
            make.centerY.equalTo(avatarImage)
        }
        
        timeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(typeButton).offset(5)
            make.centerY.equalTo(typeButton)
        }
        
        typeButton.snp_makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(avatarImage.snp_bottom)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(avatarImage).offset(kMargin)
            make.top.equalTo(avatarImage)
        }
        
        avatarImage.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(kHomeMargin)
            make.size.equalTo(CGSizeMake(36, 36))
            make.centerY.equalTo(self)
        }
        
    }
    
    /// 关注按钮
    private lazy var careButton: UIButton = {
        let careButton = UIButton()
        careButton.setTitle("+ 关注", forState: .Normal)
        careButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        careButton.backgroundColor = YMColor(42, g: 145, b: 215, a: 1.0)
        careButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        careButton.layer.cornerRadius = kCornerRadius
        careButton.layer.masksToBounds = true
        return careButton
    }()
    
    /// 时间
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.textColor = UIColor.lightGrayColor()
        timeLabel.font = UIFont.systemFontOfSize(13)
        return timeLabel
    }()
    
    /// 类型按钮
    private lazy var typeButton: UIButton = {
        let typeButton = UIButton()
        typeButton.userInteractionEnabled = false
        typeButton.sizeToFit()
        typeButton.setTitle("原创", forState: .Normal)
        typeButton.setTitleColor(YMColor(76, g: 148, b: 200, a: 1.0), forState: .Normal)
        typeButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        typeButton.layer.cornerRadius = 5
        typeButton.layer.masksToBounds = true
        typeButton.layer.borderColor = YMColor(76, g: 148, b: 200, a: 1.0).CGColor
        typeButton.layer.borderWidth = klineWidth
        return typeButton
    }()
    
    /// 标题按钮
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.systemFontOfSize(17)
        return titleLabel
    }()
    
    /// 头像
    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.backgroundColor = YMGlobalColor()
        return avatarImage
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
