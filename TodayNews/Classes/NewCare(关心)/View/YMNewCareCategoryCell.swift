//
//  YMNewCareCategoryCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMNewCareCategoryCell: UITableViewCell {

    /**
     *  选中时显示的指示器View
     */
    @IBOutlet weak var selectedIndicater: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = YMColor(244, g: 244, b: 244, a: 1.0)
        selectedIndicater.backgroundColor = YMColor(219, g: 21, b: 26, a: 1.0)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedIndicater.hidden = !selected
        textLabel?.textColor = selected ? selectedIndicater.backgroundColor : YMColor(1, g: 1, b: 1, a: 1.0)
    }
}
