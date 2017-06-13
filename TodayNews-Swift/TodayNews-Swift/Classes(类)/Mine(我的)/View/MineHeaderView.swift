//
//  MineHeaderView.swift
//  ShopKeeper
//
//  Created by 杨蒙 on 2017/6/8.
//  Copyright © 2017年 杭州逗妮开心科技有限公司. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    /** 店铺名称*/
    @IBOutlet weak var shopNameLabel: UILabel!
    /** 背景图片*/
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    /// 初始化方法
    ///
    /// - Returns: MineHeaderView
    class func mineHeaderView() -> MineHeaderView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! MineHeaderView
    }
    
    /// 管理个人资料
    @IBAction func mineManageMineInfoButtonClick() {
        
    }
    
    /// 设置按钮点击
    @IBAction func mineSettingButtonClick() {
        
    }
}

