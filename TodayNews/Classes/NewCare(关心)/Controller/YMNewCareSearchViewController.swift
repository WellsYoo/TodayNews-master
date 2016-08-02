//
//  YMNewCareSearchViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
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
        let content_url = "http://lf.snssdk.com/concern/v1/guide/page/?ab_client=a1,b2,b8,f2,f6,e1&iid=5034850950&ac=WIFI&ssmix=a&aid=13&app_name=news_article&channel=App%20Store&device_platform=iphone&idfa=7D860ECF-C119-4A2D-9870-A9CCA1AD7CFA&os_version=9.3.2&vid=8575CB9D-EFE0-411F-8E5C-DBB0D48D1948&openudid=f1503767fe6a235142ac7ae604797c1093a40488&device_type=iPhone%206&ab_feature=z1&device_id=6096495334&ab_version=concern_talk_data_test10_09&resolution=750*1334&version_code=5.7.1"
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
