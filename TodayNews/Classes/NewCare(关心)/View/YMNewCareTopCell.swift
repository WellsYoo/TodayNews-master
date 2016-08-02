//
//  YMNewCareCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class YMNewCareTopCell: UITableViewCell {
    
    var concern: YMConcern? {
        didSet {
            let url = concern!.avatar_url!
            titleImageView.kf_setImageWithURL(NSURL(string: url)!)
            titleLabel.text = concern!.name
            newButton.hidden = concern!.newly == 0 ? true : false
        }
    }

    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var newButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newButton.layer.cornerRadius = 8
        newButton.layer.masksToBounds = true
        newButton.layer.shouldRasterize = true
        newButton.layer.rasterizationScale = UIScreen.mainScreen().scale
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
