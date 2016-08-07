//
//  UIImage+Extendion.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  设置圆角
//

import UIKit

extension UIImage {
    
    func circleImage() -> UIImage {
        // false 代表透明
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // 获得上下文
        let ctx = UIGraphicsGetCurrentContext()
        // 添加一个圆
        let rect = CGRectMake(0, 0, size.width, size.height)
        CGContextAddEllipseInRect(ctx, rect)
        
        // 裁剪
        CGContextClip(ctx)
        // 将图片画上去
        drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        return image
    }
}

