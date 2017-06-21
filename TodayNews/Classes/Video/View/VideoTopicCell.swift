//
//  VideoTopicCell.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import Kingfisher

class VideoTopicCell: UITableViewCell {
    
    /// 标题 label
    @IBOutlet weak var titleLabel: UILabel!
    /// 播放数量
    @IBOutlet weak var playCountLabel: UILabel!
    /// 时间 label
    @IBOutlet weak var timeLabel: UILabel!
    /// 背景图片
    @IBOutlet weak var bgImageButton: UIButton!
    /// 用户头像
    @IBOutlet weak var headButton: UIButton!
    /// 用户昵称
    @IBOutlet weak var nameLable: UILabel!
    /// 评论数量
    @IBOutlet weak var commentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headButton.layer.cornerRadius = 15
        headButton.layer.masksToBounds = true
    }
    
    var videoTopic: WeiTouTiao? {
        didSet {
            bgImageButton.kf.setBackgroundImage(with: URL(string: (videoTopic?.video_detail_info?.detail_video_large_image?.url)!), for: .normal)
            titleLabel.text = String(describing: videoTopic!.title!)
            if let user_info = videoTopic!.user_info {
                headButton.kf.setImage(with: URL(string: user_info.avatar_url!)!, for: .normal)
                nameLable.text = user_info.name!
            }
            commentButton.setTitle(String(describing: videoTopic!.comment_count!), for: .normal)
            playCountLabel.text = videoTopic!.readCount! + "次播放"
            timeLabel.text = videoTopic!.video_duration!
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    /// 用户昵称点击
    @IBAction func headButtonClick(_ sender: UIButton) {
        
    }
    
    /// 关注按钮点击
    @IBAction func feedButtonClick(_ sender: UIButton) {
        
    }
    
    /// 评论数量按钮点击
    @IBAction func commentButtonClick(_ sender: UIButton) {
        
    }
    
    /// 更多按钮点击
    @IBAction func moreButtonClick(_ sender: UIButton) {
        
    }
    
}
