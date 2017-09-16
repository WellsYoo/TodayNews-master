//
//  UIColor+Extension.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

extension UIColor {
    // 便利初始化方法
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 背景灰色 f8f9f7
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
    
    /// 背景蓝色 4CADFD
    class func globalBlueColor() -> UIColor {
        return UIColor(r: 76, g: 173, b: 253)
    }
    
    /// RGBA的颜色设置 D23F42
    func myColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    /// 红色 D23F42 ，F55A5D （245, 90, 93）
    class func globalRedColor() -> UIColor {
        return UIColor(r: 210, g: 63, b: 66)
    }
    
    /// 随机颜色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
