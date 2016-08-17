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
    
    var coverButtonClosure: ((coverButton: UIButton)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blackColor()
        // 布局 UI
        setupUI()
        // 添加动画
        addAnimation()
    }
    
    /// 布局 UI
    func setupUI() {
        // 添加加载图片
        addSubview(loadingImageView)
        // 添加底部进度
        addSubview(progressView)
        
        addSubview(coverButton)
        // 播放按钮
        addSubview(playButton)
        // 添加灰色进度条
        addSubview(bottomToolBar)
        
        coverButton.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        playButton.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
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
    }
    
    /// 添加动画
    func addAnimation() {
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
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.loadingImageView.layer.removeAllAnimations()
            self.loadingImageView.hidden = true
            self.playButton.selected = true
        }
    }
    
    /// 覆盖一层按钮
    lazy var coverButton: UIButton = {
        let coverButton = UIButton()
        coverButton.backgroundColor = UIColor.clearColor()
        coverButton.addTarget(self, action: #selector(coverButtonClick(_:)), forControlEvents: .TouchUpInside)
        return coverButton
    }()
    
    /// 覆盖按钮点击
    func coverButtonClick(button: UIButton) {
        button.selected = !button.selected
        playButton.hidden = !button.selected
        bottomToolBar.hidden = !button.selected
        coverButtonClosure?(coverButton: button)
    }
    
    /// 播放按钮
    lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.hidden = true
        playButton.setImage(UIImage(named: "new_play_video_60x60_"), forState: .Normal)
        playButton.setImage(UIImage(named: "new_pause_video_60x60_"), forState: .Selected)
        playButton.addTarget(self, action: #selector(playButtonClick(_:)), forControlEvents: .TouchUpInside)
        return playButton
    }()
    
    /// 播放按钮点击
    func playButtonClick(button: UIButton) {
        button.selected = !button.selected
        
    }
    
    /// 加载图片，转圈圈
    lazy var loadingImageView: UIImageView = {
        let loadingImageView = UIImageView()
        loadingImageView.image = UIImage(named: "refreshicon_loading_24x24_")
        return loadingImageView
    }()
    
    /// 底部进度条
    lazy var bottomToolBar: YMProgressView = {
        let bottomToolBar = NSBundle.mainBundle().loadNibNamed(String(YMProgressView), owner: nil
            , options: nil).last as! YMProgressView
        bottomToolBar.hidden = true
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
