//
//  YMHomeMiddleCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/8.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  右边显示一张图片的情况
//

import UIKit
/// ![右边显示一张图片的情况](http://obna9emby.bkt.clouddn.com/home-cell-4.png)
class YMHomeMiddleCell: YMHomeTopicCell {
    
    var newsTopic: YMNewsTopic? {
        didSet{
            titleLabel.text = String(newsTopic!.title!)
            let mediaInfo = newsTopic!.media_info
            
            if newsTopic!.source_avatar != nil {
                nameLabel.text = newsTopic!.source
                avatarImageView.setCircleHeader(newsTopic!.source_avatar!)
                rightImageView.kf_setImageWithURL(NSURL(string: newsTopic!.source_avatar!)!)
            }
            
            if mediaInfo?.name != nil {
                nameLabel.text = mediaInfo?.name
                avatarImageView.setCircleHeader(mediaInfo!.avatar_url!)
                rightImageView.kf_setImageWithURL(NSURL(string: mediaInfo!.avatar_url!)!)
            }
            
            if newsTopic!.comment_count! >= 10000 {
                let comment_count = newsTopic!.comment_count! / 10000
                commentLabel.text = "\(comment_count)万条评论"
            } else {
                commentLabel.text = "\(newsTopic!.comment_count!)条评论"
            }
            
            if (newsTopic!.titleH + avatarImageView.height + kMargin) < newsTopic?.imageH {
                closeButton.snp_remakeConstraints(closure: { (make) in
                    make.right.equalTo(rightImageView.snp_left).offset(-kHomeMargin)
                    make.centerY.equalTo(avatarImageView)
                    make.size.equalTo(CGSizeMake(17, 12))
                })
            }
            filterWords = newsTopic?.filter_words
            let url = newsTopic!.middle_image?.url
            rightImageView.kf_setImageWithURL(NSURL(string: url!)!)
            
            if let label = newsTopic?.label {
                stickLabel.setTitle(" \(label) ", forState: .Normal)
                stickLabel.hidden = false
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(rightImageView)
        
        rightImageView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(kHomeMargin)
            make.size.equalTo(CGSizeMake(108, 70))
            make.right.equalTo(self).offset(-kHomeMargin)
        }
        
        titleLabel.snp_remakeConstraints { (make) in
            make.right.equalTo(rightImageView.snp_left).offset(-kHomeMargin)
            make.left.top.equalTo(self).offset(kHomeMargin)
        }
    }
    
    /// 右边图片
    private lazy var rightImageView: UIImageView = {
        let rightImageView = UIImageView()
        rightImageView.backgroundColor = UIColor.lightGrayColor()
        return rightImageView
    }()
    
    /// 举报按钮点击
    override func closeBtnClick() {
        closeButtonClosure?(filterWords: filterWords!)
    }
    
    /// 举报按钮点击回调
    func closeButtonClick(closure:(filterWord: [YMFilterWord])->()) {
        closeButtonClosure = closure
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
