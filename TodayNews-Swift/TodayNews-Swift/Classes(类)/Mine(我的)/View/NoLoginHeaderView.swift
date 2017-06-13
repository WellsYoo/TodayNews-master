//
//  NoLoginView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/13.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

class NoLoginHeaderView: UIView {

    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func headerView() -> NoLoginHeaderView {
        let headerView = Bundle.main.loadNibNamed(String(describing: self), owner: nil
            , options: nil)?.last as! NoLoginHeaderView
        return headerView
    }
}
