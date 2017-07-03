//
//  HomeTopicCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/2.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class HomeTopicCell: UITableViewCell {
    /// 新闻标题
    @IBOutlet weak var newsTitleLabel: UILabel!
    /// 置顶 / 热
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var hotLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var hotLabelLeading: NSLayoutConstraint!
    /// 专题
    @IBOutlet weak var specicalLabel: UILabel!
    @IBOutlet weak var specicalLabelLeading: NSLayoutConstraint!
    /// 用户名
    @IBOutlet weak var nameLabel: UILabel!
    /// 评论
    @IBOutlet weak var commentLabel: UILabel!
    /// 发布时间
    @IBOutlet weak var createTimeLabel: UILabel!
    /// 发布时间
    @IBOutlet weak var middleView: UIView!
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            newsTitleLabel.text = String(weitoutiao!.title!)
            if let hot_label = weitoutiao?.label {
                if hot_label == "置顶" || hot_label == "热" {
                    hotLabel.isHidden = false
                    hotLabel.text = hot_label
                    hotLabelWidth.constant = hot_label == "置顶" ? 30 : 15
                } else {
                    hotLabel.isHidden = true
                    hotLabelWidth.constant = 0
                }
            } else {
                hotLabel.isHidden = true
                hotLabelWidth.constant = 0
            }
            if let source = weitoutiao?.source {
                specicalLabelLeading.constant = 3
                specicalLabel.isHidden = false
                specicalLabel.text = source
            } else {
                specicalLabelLeading.constant = 0
                specicalLabel.isHidden = true
            }
            commentLabel.text = "\(weitoutiao!.comment_count!)" + "评论"
            createTimeLabel.text = weitoutiao!.createTime
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hotLabel.layer.borderColor = UIColor(r: 212, g: 61, b: 61).cgColor
        hotLabel.layer.borderWidth = 0.5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
