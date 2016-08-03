//
//  YMBlurImageView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/3.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMBlurImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加毛玻璃效果
        addSubview(blurView)
        // 添加关注图片按钮
        addSubview(avaterImageView)
        // 添加返回按钮
        addSubview(backButton)
        
        
        
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
    
    // 关注图片
    var avaterImageView: UIImageView = {
        let avaterImageView = UIImageView()
        avaterImageView.image = UIImage(named: "hrscy")
        return avaterImageView
    }()
    
    // 返回按钮
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "leftbackicon_white_titlebar_24x24_"), forState: .Normal)
        backButton.addTarget(self, action: #selector(backButtonClick), forControlEvents: .TouchUpInside)
        backButton.sizeToFit()
        return backButton
    }()
    
    // 模糊效果
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()
    
    func backButtonClick() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
