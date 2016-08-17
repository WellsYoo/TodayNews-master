//
//  YMVideoTopicCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/5.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

protocol YMVideoTopicCellDelegate: NSObjectProtocol {
    /// 昵称按钮点击
    func videoTopicCell(videoTopicCell: YMVideoTopicCell, nameButtonClick nameButton: UIButton)
    /// 背景点击
    func videoTopicCell(videoTopicCell: YMVideoTopicCell, tapBgImageViewClick bgImageView: UIImageView)
}

/// ![](http://obna9emby.bkt.clouddn.com/news/video-cell.png)
class YMVideoTopicCell: UITableViewCell {
    
    weak var delegate: YMVideoTopicCellDelegate?
    
    /// 更多按钮点击回调
    var moreButtonClosure: (() -> ())?
    
    var videoTopic: YMNewsTopic? {
        didSet {
            titleLabel.text = String(videoTopic!.title!)
            let mediaInfo = videoTopic!.media_info
            nameLabel.setTitle(mediaInfo?.name, forState: .Normal)
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
                if let watchCount = videoDetailInfo.video_watch_count {
                    if watchCount >= 10000 {
                        let watch_count = watchCount / 10000
                        countLabel.text = "\(watch_count)万次播放"
                    } else {
                        countLabel.text = "\(watchCount)次播放"
                    }
                } else {
                    countLabel.text = "0 次播放"
                }
                
                let largeImageList = videoTopic?.large_image_list.first
                bgImageView.kf_setImageWithURL(NSURL(string: largeImageList!.url!)!)
            }
            
            /// 格式化时间
            let minute = Int(videoTopic!.video_duration! / 60)
            let second = videoTopic!.video_duration! % 60
            timeLabel.text = String(format: "%02d:%02d", minute, second)
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
    @IBOutlet weak var nameLabel: UIButton!
    /// 播放数量
    @IBOutlet weak var countLabel: UILabel!
    /// 评论按钮
    @IBOutlet weak var commentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //如果发现控件的位置和尺寸不是自己设置的，那么有可能是自动伸缩属性导致
        autoresizingMask = .None
        playButton.setImage(UIImage(named: "new_play_video_60x60_"), forState: .Normal)
        playButton.setImage(UIImage(named: "new_pause_video_60x60_"), forState: .Selected)
        bgImageView.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapBgImageViewClick(_:)))
        bgImageView.addGestureRecognizer(tap)
    }
    
    /// 背景图片添加点击方法
    func tapBgImageViewClick(tapGesture: UITapGestureRecognizer) {
        playButton.selected = !playButton.selected
        let bgImageView = tapGesture.view as! UIImageView
        delegate?.videoTopicCell(self, tapBgImageViewClick: bgImageView)
    }
    
    /// 更多按钮点击
    @IBAction func moreButtonClick(sender: UIButton) {
        moreButtonClosure?()
    }
    
    /// 用户名称点击
    @IBAction func nameButtonClick(sender: UIButton) {
        delegate?.videoTopicCell(self, nameButtonClick: sender)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
