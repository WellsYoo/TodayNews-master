//
//  CareAddChannelController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/12.
//  Copyright © 2017年 hrscy. All rights reserved.
//
//  搜你关注的

import UIKit
import SnapKit

class CareAddChannelController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.white
        navigationItem.titleView = searchBar
        webView.delegate = self
        let urlString = "https://is.snssdk.com/concern/v1/guide/page/?iid=5034850950"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
    // 搜索框
    lazy var searchBar: HomeSearchBar = {
        let searchBar = HomeSearchBar.searchBar()
        searchBar.height = 30
        searchBar.width = screenWidth - 30
        searchBar.placeholder = "搜你关注的"
        searchBar.background = UIImage(named: "searchbox_search_press_20x28_")
        return searchBar
    }()
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
