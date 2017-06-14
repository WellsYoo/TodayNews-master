//
//  LoginPopViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import IBAnimatable

class LoginPopViewController: AnimatableModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 关闭按钮点击
    @IBAction func closeLoginPopViewButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
}
