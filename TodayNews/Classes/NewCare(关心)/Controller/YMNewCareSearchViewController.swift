//
//  YMNewCareSearchViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  搜索关注，其实就是一个 html 网页
//

import UIKit
import SVProgressHUD

class YMNewCareSearchViewController: YMBaseViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        let content_url = "http://lf.snssdk.com/concern/v1/guide/page/?iid=\(IID)"
        let url = NSURL(string: content_url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "搜你关心的"
        return searchBar
    }()

}

extension YMNewCareSearchViewController: UISearchBarDelegate, YMSearchContentViewControllerDelegate {
    
    // MARK: - YMSearchContentViewControllerDelegate
    func cancelButtonClickedPopViewcontroller() {
        navigationController?.popViewControllerAnimated(false)
    }
    
    // MARK: - UISearchBarDelegate
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        // 创建搜索内容控制器
        let searchContentVC = YMSearchContentViewController()
        searchContentVC.delegate = self
        let nav = YMNavigationController(rootViewController: searchContentVC)
        presentViewController(nav, animated: false, completion: nil)

        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
