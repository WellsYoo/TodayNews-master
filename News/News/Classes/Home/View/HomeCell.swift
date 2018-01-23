//
//  HomeCell.swift
//  News
//
//  Created by 杨蒙 on 2018/1/23.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell, RegisterCellFromNib {

    var aNews = NewsModel() {
        didSet {
            
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
