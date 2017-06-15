//
//  WeiTouTiaoCell.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher
import IBAnimatable

class WeiTouTiaoCell: UITableViewCell {
    /// 头像
    @IBOutlet weak var avatarImageView: AnimatableImageView!
    /// 用户名
    @IBOutlet weak var userNameLabel: UILabel!
    /// 创建时间
    @IBOutlet weak var createTimeLabel: UILabel!
    
    /// 点赞数量
    @IBOutlet weak var likeCountButton: UIButton!
    /// 评论数量
    @IBOutlet weak var commentCountButton: UIButton!
    /// 转发数量
    @IBOutlet weak var feedShareCountButton: UIButton!
    /// 位置
    @IBOutlet weak var positionLabel: UILabel!
    /// 阅读量
    @IBOutlet weak var readCountLabel: UILabel!
    /// 加『V』认证
    @IBOutlet weak var verifiedImageView: UIImageView!
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            if let user = weitoutiao?.user {
                avatarImageView.kf.setImage(with: URL(string: (user.avatar_url)!))
                userNameLabel.text = user.screen_name
            } else if let user_info = weitoutiao?.user_info {
                avatarImageView.kf.setImage(with: URL(string: (user_info.avatar_url)!))
                userNameLabel.text = user_info.name
            }
            verifiedImageView.isHidden = !weitoutiao!.user_verified!
            if let like_count = weitoutiao?.like_count {
                commentCountButton.setTitle((like_count == 0 ? "喜欢": String(like_count)), for: .normal)
            }
            if let comment_count = weitoutiao?.comment_count {
                commentCountButton.setTitle((comment_count == 0 ? "评论": String(comment_count)), for: .normal)
            }
            if let digg_count = weitoutiao?.digg_count {
                commentCountButton.setTitle((digg_count == 0 ? "转发": String(digg_count)), for: .normal)
            }
            if let position = weitoutiao?.position {
                positionLabel.text = position.position
                positionLabel.isHidden = false
            }
            readCountLabel.text = (weitoutiao?.readCount!)! + "阅读"
            readCountLabel.isHidden = (weitoutiao?.readCount!.isEmpty)!
            createTimeLabel.text = weitoutiao?.createTime
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
