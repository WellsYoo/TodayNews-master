//
//  HomeDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/8.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import WebKit

class TopicDetailController: UIViewController {
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            headerView.weitoutiao = weitoutiao!
            headerView.height = 45 + 2 * kMargin + weitoutiao!.newDetailTitleHeight!
//            let request = URLRequest(url: URL(string: weitoutiao!.article_url!)!)
//            webView.load(request)
            webView.frame = CGRect(x: 0, y: headerView.frame.maxY, width: screenWidth, height: screenHeight - headerView.frame.maxY)
        }
    }
    
    var groupID: String? {
        didSet {
            
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
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
}

extension TopicDetailController {
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(headerView)
        view.addSubview(webView)
    }
}
