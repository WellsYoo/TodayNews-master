//
//  WeitoutiaoHeaderView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/13.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

protocol WeitoutiaoHeaderViewDelegate {
    /// 文字按钮点击了
    func headerViewTextButtonClicked()
    /// 图片按钮点击了
    func headerViewImageButtonClicked()
    /// 视频按钮点击了
    func headerViewVideoButtonClicked()
}

class WeitoutiaoHeaderView: UIView {

    var delegate:WeitoutiaoHeaderViewDelegate?
    
    class func headerView() -> WeitoutiaoHeaderView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! WeitoutiaoHeaderView
    }
    
    // 文字按钮点击了
    @IBAction func textButtonClicked() {
        delegate?.headerViewTextButtonClicked()
    }
    
    // 图片按钮点击了
    @IBAction func imageButtonClicked() {
        delegate?.headerViewImageButtonClicked()
    }
    
    // 视频按钮点击了
    @IBAction func videoButtonClicked() {
        delegate?.headerViewVideoButtonClicked()
    }

}
