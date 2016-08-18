//
//  YMVideoDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/14.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMVideoDetailController: UIViewController {

    var videoTopic: YMNewsTopic?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(webView)
        view.addSubview(backButton)
        webView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        backButton.snp_makeConstraints { (make) in
            make.left.equalTo(kHomeMargin)
            make.top.equalTo(kMargin)
        }
        
        let url = NSURL(string: videoTopic!.url!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        return webView
    }()
    
    /// 返回按钮
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "white_lefterbackicon_titlebar_28x28_"), forState: .Normal)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backButtonClick), forControlEvents: .TouchUpInside)
        return backButton
    }()
    
    func backButtonClick() {
        navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension YMVideoDetailController {
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
