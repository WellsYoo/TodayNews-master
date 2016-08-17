//
//  YMUserTopicCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/14.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  视频界面，点击用户名 -> 用户详情 --> 底部的 cell
//  暂时没有调用

import UIKit
import Kingfisher

class YMUserTopicCell: UITableViewCell {
    
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 观看次数
    @IBOutlet weak var watchCountLabel: UILabel!
    /// 发布时间
    @IBOutlet weak var timeLabel: UILabel!
    /// 缩略图
    @IBOutlet weak var thumbImageView: UIImageView!
    /// 播放时长
    @IBOutlet weak var durationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
