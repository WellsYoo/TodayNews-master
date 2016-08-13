//
//  YMPopPresentationController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/13.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  iOS 8 以后推出的专门负责转场动画的控制器
//

import UIKit

class YMPopPresentationController: UIPresentationController {
    /// 定义弹出视图的大小
    var presentFrame = CGRectZero
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
//        print(presentedViewController)
        /// presentingViewController 会报一个野指针的错误，这是 Xcode 的 bug。
//        print(presentingViewController)
    }
    
    /// 即将布局转场子视图时调用
    override func containerViewWillLayoutSubviews() {
//        containerView // 容器视图
//        presentedView() // 被展现的视图
        containerView?.insertSubview(coverView, atIndex: 0)
        // 修改弹出视图的尺寸
//        if presentFrame == CGRectZero {
//            presentedView()?.frame = CGRectMake(15, 100, SCREENW - 30, 177)
//        } else {
            presentedView()?.frame = presentFrame
//        }
    }
    
    private lazy var coverView: UIView = {
        let coverView = UIView()
        coverView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        coverView.frame = UIScreen.mainScreen().bounds
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissCoverView))
        coverView.addGestureRecognizer(tap)
        return coverView
    }()
    
    func dismissCoverView() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
