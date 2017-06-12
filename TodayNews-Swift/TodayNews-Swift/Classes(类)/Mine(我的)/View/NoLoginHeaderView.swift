//
//  NoLoginHeaderView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/15.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class NoLoginHeaderView: UIView {

    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.width = screenWidth
        bgImageView.height = screenWidth / 1.96
    }
    
    class func headerView() -> NoLoginHeaderView {
        let headerView = Bundle.main.loadNibNamed(String(describing: self), owner: nil
            , options: nil)?.last as! NoLoginHeaderView
        return headerView
    }

}
