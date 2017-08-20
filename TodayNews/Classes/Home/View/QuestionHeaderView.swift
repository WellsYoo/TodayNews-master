//
//  QuestionHeaderView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/19.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class QuestionHeaderView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func headerView() -> QuestionHeaderView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! QuestionHeaderView
    }
}
