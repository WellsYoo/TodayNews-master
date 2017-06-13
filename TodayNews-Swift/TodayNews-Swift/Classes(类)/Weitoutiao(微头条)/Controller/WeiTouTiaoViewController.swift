//
//  NewCareViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hrscy. All rights reserved.
//
// 3.关注 控制器

import UIKit

class WeiTouTiaoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        // 设置 添加好友按钮
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "follow_title_profile_18x18_"), style: .plain, target: self, action: #selector(addFriendButtonClick))
    }
    
//    @IBAction func addFriendButtonClicked(_ sender: UIBarButtonItem) {
//        navigationController?.pushViewController(AddFriendViewController(), animated: true)
//    }
    

}

extension WeiTouTiaoViewController {
    
//    @objc fileprivate func addFriendButtonClick() {
//        navigationController?.pushViewController(AddFriendViewController(), animated: true)
//    }
}
