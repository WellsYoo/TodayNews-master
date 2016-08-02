//
//  YMsearchCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMsearchCell: UITableViewCell {

    var keyword: YMKeyword? {
        didSet {
            keywordLabel.text = keyword!.keyword
        }
    }
    
    
    @IBOutlet weak var keywordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
