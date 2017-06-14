//
//  MoreLoginViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 杨蒙. All rights reserved.
//
//  更多登录方式 控制器
//

import UIKit

class MoreLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setpUI()
    }
    
    /// 懒加载登录界面
    lazy var moreLoginView: MoreLoginView = {
        let moreLoginView = MoreLoginView.loginView()
        moreLoginView.frame = CGRect(x: 0, y: 44, width: screenWidth, height: screenHeight - 44)
        return moreLoginView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MoreLoginViewController {
    
    fileprivate func setpUI() {
        view.backgroundColor = UIColor.clear
        view.addSubview(moreLoginView)
    }
}
