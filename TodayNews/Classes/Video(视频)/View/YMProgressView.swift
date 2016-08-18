//
//  YMProgressView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/16.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  视频播放时底部的进度条
//

import UIKit

protocol YMProgressViewDelegate: NSObjectProtocol {
    func progressView(progressView: YMProgressView, slider: UISlider)
}

class YMProgressView: UIView {
    
    var delegate: YMProgressViewDelegate?
    
    /// 当前时间
    @IBOutlet weak var currentTimeLabel: UILabel!
    /// 总时长
    @IBOutlet weak var totalTimeLabel: UILabel!
    /// 播放进度
    @IBOutlet weak var slider: UISlider!
    /// 全屏按钮
    @IBOutlet weak var fullScreenButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fullScreenButton.setImage(UIImage(named: "video_fullscreen"), forState: .Normal)
        fullScreenButton.setImage(UIImage(named: "video_minimize"), forState: .Selected)
    }
    
    /// 全屏按钮点击
    @IBAction func fullScreenButtonClick(sender: UIButton) {
        sender.selected = !sender.selected
        
    }
    
    /// 滑块值发生变化
    @IBAction func sliderValueChanged(sender: UISlider) {
        delegate?.progressView(self, slider: sender)
    }
    
    @IBAction func slider(sender: UISlider) {
        
    }
    
}
