//
//  FollowDetailViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/25.
//  Copyright © 2017年 hrscy. All rights reserved.
//
//  关注详情
//

import UIKit

class FollowDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    var userid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        NetworkTool.loadOneFollowDetail(userId: userid) { (followDetail) in
            self.headerView.follewDetail = followDetail
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var headerView: ConcernHeaderView = {
        let headerView = ConcernHeaderView()
        headerView.width = screenWidth
        return headerView
    }()
    
}

extension FollowDetailViewController {
    
    fileprivate func setupUI() {
        scrollView.addSubview(headerView)
        
    }
}
