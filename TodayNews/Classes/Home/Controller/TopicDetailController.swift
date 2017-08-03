//
//  HomeDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/8.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class TopicDetailController: UIViewController {
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            headerView.weitoutiao = weitoutiao!
            headerView.height = 45 + 2 * kMargin + weitoutiao!.newDetailTitleHeight!
        }
    }
    
    var groupID: String? {
        didSet {
            NetworkTool.loadNewsDetail(groupID: groupID!)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.isNavigationBarHidden = false
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate lazy var headerView: NewsDetailHeaderView = {
        let headerView = NewsDetailHeaderView.headerView()
        headerView.x = 0
        headerView.y = kNavBarHeight
        return headerView
    }()
}

extension TopicDetailController {
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(headerView)
        
    }
}
