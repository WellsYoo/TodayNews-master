//
//  MyChannelRecommendView.swift
//  News
//
//  Created by 杨蒙 on 2018/2/3.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit

/// 我的频道推荐
class MyChannelReusableView: UICollectionReusableView, RegisterCellFromNib {
    
    /// 点击了编辑 / 完成 按钮
    var channelReusableViewEditButtonClicked: ((_ sender: UIButton)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        editChannelButton.layer.borderColor = UIColor.globalRedColor().cgColor
        editChannelButton.layer.borderWidth = 1
        editChannelButton.setTitle("完成", for: .selected)
        NotificationCenter.default.addObserver(self, selector: #selector(longPressTarget), name: NSNotification.Name(rawValue: "longPressTarget"), object: nil)
    }
    
    @objc private func longPressTarget() {
        editChannelButton.isSelected = true
    }
    
    @IBOutlet weak var editChannelButton: UIButton!
    
    @IBAction func editButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        channelReusableViewEditButtonClicked?(sender)
    }
    /// 移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
