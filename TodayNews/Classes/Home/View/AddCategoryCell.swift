//
//  AddCategoryCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/6.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class AddCategoryCell: UICollectionViewCell {

    var isEdit = false {
        didSet {
            deleteCategoryButton.isHidden = !isEdit
        }
    }
    
    @IBOutlet weak var titleButton: UIButton!
    
    @IBOutlet weak var deleteCategoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
