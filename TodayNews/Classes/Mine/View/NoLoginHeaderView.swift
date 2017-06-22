//
//  NoLoginView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/13.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

protocol NoLoginHeaderViewDelegate: class {
    /// 更多登录方式按钮点击
    func noLoginHeaderViewMoreLoginButotnClicked()
    
}

class NoLoginHeaderView: UIView {
    
    weak var delegate: NoLoginHeaderViewDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.height = screenWidth * 0.595
    }
    
    class func headerView() -> NoLoginHeaderView {
        let headerView = Bundle.main.loadNibNamed(String(describing: self), owner: nil
            , options: nil)?.last as! NoLoginHeaderView
        return headerView
    }
    
    /// 更多登录方式按钮点击
    @IBAction func moreLoginButtonCLicked() {
        delegate?.noLoginHeaderViewMoreLoginButotnClicked()
    }
}
