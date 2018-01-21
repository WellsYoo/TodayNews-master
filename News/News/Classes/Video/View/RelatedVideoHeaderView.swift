//
//  RelatedVideoHeaderView.swift
//  News
//
//  Created by 杨蒙 on 2018/1/21.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import IBAnimatable

class RelatedVideoHeaderView: UIView, NibLoadable {

    var video = NewsModel() {
        didSet {
            titleLabel.text = video.title
            playCountLabel.text = video.video_detail_info.videoWatchCount! + "次播放"
            if titleLabelHeight.constant > 25 { height += 20 }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelHeight: NSLayoutConstraint!
    /// 播放次数
    @IBOutlet weak var playCountLabel: UILabel!
    /// 发布时间
    @IBOutlet weak var publishTimeLabel: UILabel!
    /// 描述
    @IBOutlet weak var descriptionLabel: UILabel!
    /// 点赞
    @IBOutlet weak var diggButton: AnimatableButton!
    /// 展开按钮点击
    @IBAction func foldButtonClicked(_ sender: UIButton) {
        
    }
    
    /// 点赞按钮点击
    @IBAction func diggButtonClicked(_ sender: AnimatableButton) {
        
    }
    /// 朋友圈按钮点击
    @IBAction func pyqButtonClicked(_ sender: AnimatableButton) {
        
    }
    /// 朋友圈按钮点击
    @IBAction func wechatButtonClicked(_ sender: AnimatableButton) {
        
    }
    
    
}
