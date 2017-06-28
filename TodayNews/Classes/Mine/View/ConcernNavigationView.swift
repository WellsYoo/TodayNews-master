//
//  ConcernNavigationView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/28.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

protocol ConcernNavigationViewDelegate: class {
    
    func concernHeaderViewReturnButtonClicked()
    
    func concernHeaderViewMoreButtonClicked()
}

class ConcernNavigationView: UIView {

    weak var delegate: ConcernNavigationViewDelegate?
    /// 返回按钮
    @IBOutlet weak var returnButton: UIButton!
    /// 更多按钮
    @IBOutlet weak var moreButton: UIButton!

    class func concernNavView() -> ConcernNavigationView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! ConcernNavigationView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        width = screenWidth
        height = 64
    }
    
    @IBAction func returnButtonClicked(_ sender: UIButton) {
        delegate?.concernHeaderViewReturnButtonClicked()
    }
    
    @IBAction func moreButtonClicked(_ sender: UIButton) {
        delegate?.concernHeaderViewMoreButtonClicked()
    }
    
}
