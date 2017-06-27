//
//  FollowDetailViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/25.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class FollowDetailViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    var userid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        NetworkTool.loadOneFollowDetail(userId: userid) { (followDetail) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
