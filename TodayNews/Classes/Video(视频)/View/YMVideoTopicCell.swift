//
//  YMVideoTopicCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/5.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMVideoTopicCell: UITableViewCell {
    
    var videoTopic: YMNewsTopic? {
        didSet {
            titleLabel.text = String(videoTopic!.title!)
            let mediaInfo = videoTopic!.media_info
            nameLabel.text = mediaInfo?.name
            avatarImageView.setCircleHeader(mediaInfo!.avatar_url!)
            if videoTopic!.comment_count! == 0 {
                commentButton.setTitle("评论", forState: .Normal)
            } else if videoTopic!.comment_count! >= 10000 {
                let comment_count = videoTopic!.comment_count! / 10000
                commentButton.setTitle("\(comment_count)万", forState: .Normal)
            } else {
                commentButton.setTitle("\(videoTopic!.comment_count!)", forState: .Normal)
            }
            if let videoDetailInfo = videoTopic?.video_detail_info {
                if videoDetailInfo.video_watch_count >= 10000 {
                    let watch_count = videoDetailInfo.video_watch_count! / 10000
                    countLabel.text = "\(watch_count)万次播放"
                } else {
                    countLabel.text = "\(videoDetailInfo.video_watch_count!)次播放"
                }
                let videoImage = videoDetailInfo.detail_video_large_image
                bgImageView.kf_setImageWithURL(NSURL(string: videoImage!.url!)!)
            }
        }
    }
    
    /// 标题 label
    @IBOutlet weak var titleLabel: UILabel!
    /// 背景图片
    @IBOutlet weak var bgImageView: UIImageView!
    /// 播放按钮
    @IBOutlet weak var playButton: UIButton!
    /// 时间 label
    @IBOutlet weak var timeLabel: UILabel!
    /// 用户头像
    @IBOutlet weak var avatarImageView: UIImageView!
    /// 用户昵称
    @IBOutlet weak var nameLabel: UILabel!
    /// 播放数量
    @IBOutlet weak var countLabel: UILabel!
    /// 评论按钮
    @IBOutlet weak var commentButton: UIButton!
    /// 更多按钮
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
