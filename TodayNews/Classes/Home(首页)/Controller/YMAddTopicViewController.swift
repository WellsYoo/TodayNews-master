//
//  YMAddTopicViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/3.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMAddTopicViewController: UIViewController {
    /// 我的频道
    var myTopics = [YMHomeTopTitle]()
    /// 推荐频道
    var recomendTopics = [YMHomeTopTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "X", style: .Plain, target: self, action: #selector(closeBBItemClick))
        // 去除 navigationBar 底部的黑线
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }
    
    func closeBBItemClick() {
        dismissViewControllerAnimated(false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
