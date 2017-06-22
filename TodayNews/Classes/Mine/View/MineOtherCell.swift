//
//  YMMineOtherCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/22.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class MineOtherCell: UITableViewCell {
    /// 标题
    @IBOutlet weak var leftlabel: UILabel!
    /// 右侧标签
    @IBOutlet weak var rightLabel: UILabel!
    
    var mineCellModel: MineCellModel? {
        didSet {            
            leftlabel.text = mineCellModel?.text!
            rightLabel.text = mineCellModel?.grey_text!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
