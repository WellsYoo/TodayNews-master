//
//  YMPopViewAnimator.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/13.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMPopViewAnimator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    /// 定义弹出视图的大小
    var presentFrame = CGRectZero
    /// 记录当前是否展开视图
    var isPresent: Bool = false
    
    // MARK: - UIViewControllerTransitioningDelegate
    /**
     告诉系统由哪个控制器来实现代理
     - parameter presented:  被展现的视图
     - parameter presenting: 展现的视图
     - returns: YMPopPresentationController iOS 8 以后推出的专门负责转场动画的控制器
     */
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let popPC = YMPopPresentationController(presentedViewController: presented, presentingViewController: presenting)
        popPC.presentFrame = presentFrame
        return popPC
    }
    
    /**
     告诉系统谁来负责 modal 的展现动画
     - parameter presented:  被展现的视图
     - parameter presenting: 展现的视图
     - returns: 由谁管理
     */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    /**
     告诉系统谁来负责 modal 的消失动画
     - parameter dismissed: 消失的控制器
     - returns: 由谁管理
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    // MARK: - 只要实现了下面两个方法，那么系统默认就没有了，所有东西都需要自己实现
    /** 动画时长*/
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    /** 负责转场动画的效果*/
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            // 展开
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            // 一定要将视图添加到容器上
            transitionContext.containerView()?.addSubview(toView!)
            // 锚点
            toView?.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
            toView?.transform = CGAffineTransformMakeScale(0.0, 0.0)
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                toView?.transform = CGAffineTransformIdentity
                }, completion: { (_) in
                    transitionContext.completeTransition(true)
            })
        } else {
            // 关闭
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            // CGFloat 是不准确的，如果写 0.0 会没有动画
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromView?.transform = CGAffineTransformMakeScale(0.000001, 0.000001)
                }, completion: { (_) in
                    transitionContext.completeTransition(true)
            })
        }
    }
}
