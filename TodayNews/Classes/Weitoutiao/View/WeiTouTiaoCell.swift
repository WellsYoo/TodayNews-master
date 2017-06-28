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

protocol WeitoutiaoCellDelegate: class {
    
    func weiTouTiaoCelloffeedShareButtonClicked(weitoutiaoCell: WeiTouTiaoCell)
    /// 头像区域点击
    func weiTouTiaoCellofHeaderButtonClicked(weitoutiao: WeiTouTiao)
    
}

class WeiTouTiaoCell: UITableViewCell {
    
    weak var delegate: WeitoutiaoCellDelegate?
    /// 头像
    @IBOutlet weak var avatarImageView: AnimatableImageView!
    /// 用户名
    @IBOutlet weak var userNameLabel: UILabel!
    /// 创建时间
    @IBOutlet weak var createTimeLabel: UILabel!
    // 关注按钮
    @IBOutlet weak var careButton: AnimatableButton!
    /// 内容
    @IBOutlet weak var contentLabel: UILabel!
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
    /// 中间 View
    @IBOutlet weak var middleView: UIView!
    /// 头像区域点击
    var headerButtonClick: (()->())?
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            if let user = weitoutiao!.user {
                avatarImageView.kf.setImage(with: URL(string: (user.avatar_url)!))
                userNameLabel.text = user.screen_name
                if let isFllowing = user.is_following {
                    careButton.isHidden = isFllowing
                }
            } else if let user_info = weitoutiao!.user_info {
                avatarImageView.kf.setImage(with: URL(string: (user_info.avatar_url)!))
                userNameLabel.text = user_info.name
                if let isFllowing = user_info.is_following {
                    careButton.isHidden = isFllowing
                }
            }
            verifiedImageView.isHidden = !weitoutiao!.user_verified!
            if let like_count = weitoutiao!.like_count {
                likeCountButton.setTitle((like_count == 0 ? "喜欢": String(like_count)), for: .normal)
            }
            if let comment_count = weitoutiao!.comment_count {
                commentCountButton.setTitle((comment_count == 0 ? "评论": String(comment_count)), for: .normal)
            }
            if let digg_count = weitoutiao!.digg_count {
                feedShareCountButton.setTitle((digg_count == 0 ? "转发": String(digg_count)), for: .normal)
            }
            
            if let position = weitoutiao!.position {
                positionLabel.text = position.position
                positionLabel.isHidden = false
            }
            readCountLabel.text = weitoutiao!.readCount! + "阅读"
            readCountLabel.isHidden = (weitoutiao?.readCount!.isEmpty)!
            createTimeLabel.text = weitoutiao!.createTime
            if weitoutiao!.title!.isEqual(to: "") {
                contentLabel.text = String(describing: weitoutiao!.content!)
            } else {
                contentLabel.text = String(describing: weitoutiao!.title!)
            }
            if let video_detail_info = weitoutiao?.video_detail_info {
                let detail_video_large_image = video_detail_info.detail_video_large_image
                videoView.imageButton.kf.setBackgroundImage(with: URL(string: (detail_video_large_image?.url)!), for: .normal)
                self.middleView.addSubview(videoView)
                videoView.snp.makeConstraints({ (make) in
                    make.top.left.bottom.right.equalTo(self.middleView)
                })
            }
            if weitoutiao?.thumb_image_list.count != 0 {
                self.middleView.addSubview(thumbCollectionView)
                thumbCollectionView.snp.makeConstraints({ (make) in
                    make.top.left.bottom.right.equalTo(self.middleView)
                })
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.layer.masksToBounds = true
        careButton.setTitle("已关注", for: .selected)
        careButton.setTitleColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.6), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 视频图片
    private lazy var videoView: CellVideoView = {
        let videoView = CellVideoView.cellVideoView()
        return videoView
    }()
    
    /// 缩略图
    private lazy var thumbCollectionView: ThumbCollectionView = {
        let thumbCollectionView = ThumbCollectionView.collectionViewWithFrame(frame: CGRect.zero)
        thumbCollectionView.register(UINib(nibName: String(describing: ThumbCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ThumbCollectionViewCell.self))
        thumbCollectionView.isScrollEnabled = false
        thumbCollectionView.delegate = self
        thumbCollectionView.dataSource = self
        return thumbCollectionView
    }()
    
    
}

extension WeiTouTiaoCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (weitoutiao?.thumb_image_list.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ThumbCollectionViewCell.self), for: indexPath) as! ThumbCollectionViewCell
        let thumbImage = weitoutiao?.thumb_image_list[indexPath.item]
        cell.thumbImageURL = (thumbImage?.url)!
        return cell
    }
}

extension WeiTouTiaoCell {
    
    /// 头像区域点击
    @IBAction func headerButtonClicked() {
        // 使用闭包
//        headerButtonClick?()
        delegate?.weiTouTiaoCellofHeaderButtonClicked(weitoutiao: weitoutiao!)
    }
    
    /// 点赞按钮
    @IBAction func likeButtonClicked() {
        
    }
    
    /// 评论按钮点击
    @IBAction func commentButtonClicked() {
        
    }
    /// 转发按钮点击
    @IBAction func feedShareButtonClicked() {
        delegate?.weiTouTiaoCelloffeedShareButtonClicked(weitoutiaoCell: self)
    }
    /// 关注按钮点击
    @IBAction func careButtonClicked(_ sender: AnimatableButton) {
        
        var userId: Int = 0
        if let user = weitoutiao?.user {
            userId = user.user_id!
        } else if let user_info = weitoutiao?.user_info {
            userId = user_info.user_id!
        }
        if !sender.isSelected {
            // 关注
            NetworkTool.loadFollowInfo(user_id: userId) { (isFllowing) in
                if isFllowing {
                    self.careButton.isSelected = true
                    self.careButton.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .selected)
                    self.careButton.borderColor = UIColor(r: 245, g: 245, b: 245)
                    self.careButton.borderWidth = 1
                }
            }
        } else {
            // 取消关注
            NetworkTool.loadUnfollowInfo(user_id: userId, completionHandler: { (isFllowing) in
                if !isFllowing {
                    self.careButton.isSelected = false
                    self.careButton.borderWidth = 0
                    self.careButton.backgroundColor = UIColor(r: 42, g: 144, b: 215)
                    self.careButton.cornerRadius = 5
                }
            })
        }
    }
    
    /// 屏蔽按钮点击
    @IBAction func closeButton() {
        
    }
}

