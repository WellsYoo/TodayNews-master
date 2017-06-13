//
//  AddFriendViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/12.
//  Copyright © 2017年 杨蒙. All rights reserved.
//
//  添加朋友 控制器

import UIKit
import SnapKit

class AddFriendViewController: UIViewController, UIWebViewDelegate {
    
    var webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension AddFriendViewController {
    
    fileprivate func setupUI() {
        navigationItem.title = "添加好友"
        // 设置 添加好友按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "告诉朋友", style: .plain, target: self, action: #selector(tellFriendsButtonClick))
        
        view.backgroundColor = UIColor.white
        webView.delegate = self
        let urlString = "https://is.snssdk.com/concern/v1/guide/page/?iid=5034850950"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}

extension AddFriendViewController {
    // 告诉朋友 按钮点击
    @objc fileprivate func tellFriendsButtonClick() {
        navigationController?.pushViewController(TellFriendsViewController(), animated: true)
    }
}
