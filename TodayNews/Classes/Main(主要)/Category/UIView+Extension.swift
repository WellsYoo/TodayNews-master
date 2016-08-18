//
//  UIViewExtension.swift
//  LongLian369
//
//  Created by 杨蒙 on 16/7/3.
//  Copyright © 2016年 北京龙链科技有限公司. All rights reserved.
//

import UIKit

extension UIView {
    
    func isShowingOneKeyWindow() -> Bool {
        // 主窗口
        let keyWindow = UIApplication.sharedApplication().keyWindow
        // 以主窗口左上角为坐标原点，计算 self 的矩形框
        let newFrame = keyWindow?.convertRect(frame, fromView: superview)
        let winBounds = keyWindow?.bounds
        // 主窗口的bounds 和 self的矩形框 是否有重叠
        let intersects = CGRectIntersectsRect(newFrame!, winBounds!)
        
        return !hidden && alpha > 0.01 && self.window == keyWindow && intersects
    }
    
    /// 裁剪 view 的圆角
    func clipRectCorner(direction: UIRectCorner, cornerRadius: CGFloat) {
        let cornerSize = CGSizeMake(cornerRadius, cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
}