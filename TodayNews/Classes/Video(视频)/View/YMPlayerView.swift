//
//  YMPlayerView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/16.
//  Copyright © 2016年 hrscy. All rights reserved.
//
// 播放视频的 view，只作为播放视频容器
//

import UIKit
import SnapKit
import AVFoundation

class YMPlayerView: UIView {
    
    var playerItem: AVPlayerItem? {
        didSet {
            player.replaceCurrentItemWithPlayerItem(playerItem)
            player.play()
        }
    }
    // 覆盖按钮回调
    var coverButtonClosure: ((coverButton: UIButton)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blackColor()
        // 布局 UI
        setupUI()
    }
    
    /// 布局 UI
    func setupUI() {
        // 添加底部进度
        addSubview(progressView)
        // 设置播放器
        playerLayer.player = player
        // 设置 frame 320 : 209，参见 YMVideoTopicCell 中 背景的大小
        playerLayer.frame = CGRectMake(0, 0, SCREENW, SCREENW * 209 / 320)
        playerLayer.backgroundColor = UIColor.cyanColor().CGColor
        // 添加播放器的 layer
        layer.addSublayer(playerLayer)
        // 添加覆盖按钮
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
    }
    
    /// 播放器的 Layer
    lazy var playerLayer: AVPlayerLayer = {
        let playerLayer = AVPlayerLayer()
        return playerLayer
    }()
    
    /// 播放器
    private lazy var player: AVPlayer = {
        let player = AVPlayer()
        return player
    }()
    
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
