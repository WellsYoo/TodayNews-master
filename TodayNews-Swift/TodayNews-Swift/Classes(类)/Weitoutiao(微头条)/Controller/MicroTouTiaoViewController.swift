//
//  NewCareViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hrscy. All rights reserved.
//
// 3.关注 控制器

import UIKit

class MicroTouTiaoViewController: UIViewController {

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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add_channel_titlbar_thin_new_16x16_"), style: .done, target: self, action: #selector(addChannelButtonClick))
    }
    
    @objc private func addChannelButtonClick() {
        navigationController?.pushViewController(CareAddChannelController(), animated: true)
    }

}
