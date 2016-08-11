//
//  YMHomeDetailBottomView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/11.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMHomeDetailBottomView: UIView {

    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var textFiled: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textFiled.placeholder = "  写评轮..."
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
        
    }
}
