//
//  YMHomeSmallCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/8.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  中间显示三张小图的情况
//

import UIKit
/// ![](http://obna9emby.bkt.clouddn.com/home-cell-3.png)
class YMHomeSmallCell: YMHomeTopicCell {
    
    var newsTopic: YMNewsTopic? {
        didSet{
            titleLabel.text = String(newsTopic!.title!)
            let mediaInfo = newsTopic!.media_info
            
            if newsTopic!.source_avatar != nil {
                nameLabel.text = newsTopic!.source
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
            
            if newsTopic!.image_list.count > 0 {
                for index in 0..<newsTopic!.image_list.count {
                    let imageView = UIImageView()
                    let imageList = newsTopic!.image_list[index]
                    let urlLlist = imageList.url_list![index]
                    let urlString = urlLlist["url"] as! String
                    if urlString.hasSuffix(".webp") {
                        let range = urlString.rangeOfString(".webp")
                        let url = urlString.substringToIndex(range!.startIndex)
                        imageView.kf_setImageWithURL(NSURL(string: url)!)
                    } else {
                        imageView.kf_setImageWithURL(NSURL(string: urlString)!)
                    }
                    let x: CGFloat = CGFloat(index) * (newsTopic!.imageW + 6)
                    imageView.frame = CGRectMake(x, 0, newsTopic!.imageW, newsTopic!.imageH)
                    imageView.backgroundColor = UIColor.lightGrayColor()
                    middleView.addSubview(imageView)
                }
            }
            
            if let label = newsTopic?.label {
                stickLabel.setTitle(" \(label) ", forState: .Normal)
                stickLabel.hidden = false
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(middleView)
        
        middleView.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(kMargin)
            make.left.equalTo(titleLabel.snp_left)
            make.right.equalTo(titleLabel.snp_right)
            make.bottom.equalTo(avatarImageView.snp_top).offset(-kMargin)
        }
    }
    
    /// 中间 3 张图的容器
    private lazy var middleView: UIView = {
        let middleView = UIView()
        return middleView
    }()
    
    /// 举报按钮点击
    override func closeBtnClick() {
        closeButtonClosure?(filterWords: filterWords!)
    }
    
    /// 举报按钮点击回调
    func closeButtonClick(closure:(filterWords: [YMFilterWord])->()) {
        closeButtonClosure = closure
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
