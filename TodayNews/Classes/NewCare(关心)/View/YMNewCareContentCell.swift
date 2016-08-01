//
//  YMNewCareContentCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMNewCareContentCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var avaterImageView: UIImageView!
    
    @IBOutlet weak var peopleCountLabel: UILabel!
    
    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var careButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        careButton.layer.cornerRadius = 7
        careButton.layer.masksToBounds = true
        careButton.layer.borderColor = YMColor(91, g: 162, b: 207, a: 1.0).CGColor
        careButton.layer.borderWidth = klineWidth
        careButton.layer.shouldRasterize = true
        careButton.layer.rasterizationScale = UIScreen.mainScreen().scale
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
