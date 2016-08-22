//
//  YMHomeDetailBottomView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/11.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  新闻详情底部的评论
//

import UIKit
/// ![](http://obna9emby.bkt.clouddn.com/news/home-detail-bottom.png)
class YMHomeDetailBottomView: UIView {
    
    var commentCount: Int? {
        didSet {
            // 评论数量
            commentCountLabel.text = "\(commentCount!) "
            commentCountLabel.hidden = (commentCount == 0) ? true : false
        }
    }
    

    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var textFiled: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentCountLabel.sizeToFit()
        textFiled.placeholder = "  写评论..."
        textFiled.layer.cornerRadius = 15
        textFiled.layer.masksToBounds = true
        textFiled.layer.borderColor = YMColor(220, g: 220, b: 220, a: 1.0).CGColor
        textFiled.layer.borderWidth = klineWidth
    }

    @IBAction func commentButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func shareButtonClick(sender: UIButton) {
        YMHomeShareView.show()
    }
}
