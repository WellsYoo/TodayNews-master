//
//  YMHomeLargeCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/8.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  中间显示一张大图的情况
//
import UIKit
/// ![](http://obna9emby.bkt.clouddn.com/home-cell-2.png)
/// ![](http://obna9emby.bkt.clouddn.com/home-cell-5.png)
class YMHomeLargeCell: YMHomeTopicCell {
    
    var newsTopic: YMNewsTopic? {
        didSet{
            titleLabel.text = String(newsTopic!.title!)
            
            if newsTopic!.source_avatar != nil {
                nameLabel.text = newsTopic!.source
                avatarImageView.setCircleHeader(newsTopic!.source_avatar!)
            }
            
            if let mediaInfo = newsTopic!.media_info {
                nameLabel.text = mediaInfo.name
                avatarImageView.setCircleHeader(mediaInfo.avatar_url!)
            }
            
            if newsTopic!.comment_count! >= 10000 {
                let comment_count = newsTopic!.comment_count! / 10000
                commentLabel.text = "\(comment_count)万条评论"
            } else {
                commentLabel.text = "\(newsTopic!.comment_count!)条评论"
            }
            
            filterWords = newsTopic?.filter_words
            let videoDetailInfo = newsTopic?.video_detail_info
            var urlString = String()
            if videoDetailInfo?.video_id != nil {
                urlString = videoDetailInfo!.detail_video_large_image!.url!
                /// 格式化时间
                let minute = Int(newsTopic!.video_duration! / 60)
                let second = newsTopic!.video_duration! % 60
                rightBottomLabel.text = String(format: "%02d:%02d", minute, second)
            } else {
                urlString = newsTopic!.large_image_list.first!.url!
                rightBottomLabel.text = "\(newsTopic!.gallary_image_count)图"
            }

            
            largeImageView.kf_setImageWithURL(NSURL(string: urlString)!)
            if let label = newsTopic?.label {
                if label == "" {
                    stickLabel.hidden = true
                } else {
                    stickLabel.setTitle(" \(label) ", forState: .Normal)
                    stickLabel.hidden = false
                }
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(largeImageView)
        
        largeImageView.addSubview(rightBottomLabel)
        
        largeImageView.addSubview(playButton)
        
        largeImageView.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(kMargin)
            make.left.equalTo(titleLabel.snp_left)
            make.right.equalTo(titleLabel.snp_right)
            make.size.equalTo(CGSizeMake(SCREENW - 30, 170))
        }
        
        rightBottomLabel.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(50, 20))
            make.right.equalTo(largeImageView.snp_right).offset(-7)
            make.bottom.equalTo(largeImageView.snp_bottom).offset(-7)
        }
        
        playButton.snp_makeConstraints { (make) in
            make.center.equalTo(largeImageView)
        }
        
    }
    
    /// 中间的播放按钮
    private lazy var playButton: UIButton = {
        let playButotn = UIButton()
        playButotn.setImage(UIImage(named: "playicon_video_60x60_"), forState: .Normal)
        playButotn.sizeToFit()
        playButotn.addTarget(self, action: #selector(playButtonClick), forControlEvents: .TouchUpInside)
        return playButotn
    }()
    
    /// 右下角显示图片数量或视频时长
    lazy var  rightBottomLabel: UILabel = {
        let rightBottomLabel = UILabel()
        rightBottomLabel.textAlignment = .Center
        rightBottomLabel.layer.cornerRadius = 10
        rightBottomLabel.layer.masksToBounds = true
        rightBottomLabel.font = UIFont.systemFontOfSize(13)
        rightBottomLabel.textColor = UIColor.whiteColor()
        rightBottomLabel.backgroundColor = YMColor(0, g: 0, b: 0, a: 0.6)
        return rightBottomLabel
    }()
    
    /// 中间大图
    private lazy var largeImageView: UIImageView = {
        let largeImageView = UIImageView()
        largeImageView.backgroundColor = UIColor.lightGrayColor()
        return largeImageView
    }()
    
    /// 举报按钮点击
    override func closeBtnClick() {
        closeButtonClosure?(filterWords: filterWords!)
    }
    
    /// 播放按钮点击
    func playButtonClick() {
        
    }
    
    /// 举报按钮点击回调
    func closeButtonClick(closure:(filterWord: [YMFilterWord])->()) {
        closeButtonClosure = closure
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
