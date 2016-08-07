//
//  YMTopicTableViewCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/4.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMTopicTableViewCell: UITableViewCell {
    
    var filterWords: [YMFilterWord]?
    
    var closeButtonClosure: ((filterWords: [YMFilterWord])->())?
    
    var newsTopic: YMNewsTopic? {
        didSet{
            titleLabel.text = String(newsTopic!.title!)
            let mediaInfo = newsTopic?.media_info
            
            if newsTopic?.source! == "专题" {
                nameLabel.text = newsTopic?.source
                avatarImageView.setCircleHeader(newsTopic!.source_avatar!)
            }
            
            if mediaInfo?.name != nil {
                nameLabel.text = mediaInfo?.name
                avatarImageView.setCircleHeader(mediaInfo!.avatar_url!)
            }
            
            if newsTopic!.comment_count! >= 10000 {
                let comment_count = newsTopic!.comment_count! / 10000
                commentLabel.text = "\(comment_count)万条评论"
            } else {
                commentLabel.text = "\(newsTopic!.comment_count!)条评论"
            }
            filterWords = newsTopic?.filter_words
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        
        addSubview(avatarImageView)
        
        addSubview(nameLabel)
        
        addSubview(commentLabel)
        
        addSubview(closeButton)
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.top.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
        }
        
        avatarImageView.snp_makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp_left)
            make.bottom.equalTo(self.snp_bottom).offset(-15)
            make.size.equalTo(CGSizeMake(16, 16))
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp_right).offset(5)
            make.centerY.equalTo(avatarImageView)
        }
        
        commentLabel.snp_makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp_right).offset(5)
            make.centerY.equalTo(nameLabel)
        }
        
        closeButton.snp_makeConstraints { (make) in
            make.right.equalTo(titleLabel.snp_right)
            make.centerY.equalTo(avatarImageView)
            make.size.equalTo(CGSizeMake(17, 12))
        }
    }
    
    /// 新闻标题
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfSize(17)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.blackColor()
        return titleLabel
    }()
    
    /// 用户名
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        return avatarImageView
    }()
    
    /// 用户名
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFontOfSize(13)
        nameLabel.textColor = UIColor.lightGrayColor()
        return nameLabel
    }()
    
    /// 评论
    private lazy var commentLabel: UILabel = {
        let comentLabel = UILabel()
        comentLabel.font = UIFont.systemFontOfSize(13)
        comentLabel.textColor = UIColor.lightGrayColor()
        return comentLabel
    }()
    
    /// 时间
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFontOfSize(13)
        timeLabel.textColor = UIColor.lightGrayColor()
        return timeLabel
    }()
    
    /// 举报按钮
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "add_textpage_17x12_"), forState: .Normal)
        closeButton.addTarget(self, action: #selector(closeBtnClick), forControlEvents: .TouchUpInside)
        return closeButton
    }()
    
    /// 举报按钮点击
    func closeBtnClick() {
//        closeButtonClosure?(filterWords: filterWords!)
    }
    /// 举报按钮点击回调
    func closeButtonClick(closure:(filterWord: [YMFilterWord])->()) {
//        closeButtonClosure = closure
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
