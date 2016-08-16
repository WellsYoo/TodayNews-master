//
//  YMPlayerView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/16.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

/// 播放视频的 view，只用来播放视频
class YMPlayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blackColor()
        
        setupUI()
    }
    
    func setupUI() {
        // 添加加载图片
        addSubview(loadingImageView)
        // 添加灰色进度条
        addSubview(bottomToolBar)
        // 添加底部进度
        addSubview(progressView)
        
        progressView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
        }
        
        bottomToolBar.snp_makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(40)
        }
        
        loadingImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSizeMake(24, 24))
        }
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1
        // 绕 z 轴旋转 180°
        animation.toValue = M_PI * 2.0
        animation.cumulative = true
        animation.removedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        // 如果是在 OC 里，应这样写 animation.repeatCount = HUGE_VALF;
        animation.repeatCount = Float.infinity
        animation.fillMode = kCAFillModeForwards
        loadingImageView.layer.addAnimation(animation, forKey: animation.keyPath)
    }
    
    /// 加载图片
    lazy var loadingImageView: UIImageView = {
        let loadingImageView = UIImageView()
        loadingImageView.image = UIImage(named: "refreshicon_loading_24x24_")
        return loadingImageView
    }()
    
    /// 底部进度条
    lazy var bottomToolBar: YMProgressView = {
        let bottomToolBar = YMProgressView()
//        bottomToolBar.hidden = true
        return bottomToolBar
    }()
    
    /// 当底部进度条隐藏的时候，出现底部的
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.hidden = true
        // 设置走过的颜色
        progressView.progressTintColor = YMColor(246, g: 68, b: 64, a: 1.0)
        // 设置未走过的颜色
        progressView.trackTintColor = UIColor.lightGrayColor()
        progressView.progress = 0.5
        return progressView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
