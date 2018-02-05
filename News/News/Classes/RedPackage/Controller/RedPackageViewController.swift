//
//  RedPackageViewController.swift
//  News
//
//  Created by 杨蒙 on 2018/2/5.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import WebKit

class RedPackageViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.tableViewBackgroundColor"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.windowColor"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置 UI
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension RedPackageViewController {
    /// 设置 UI
    private func setupUI() {
        // 判断是否是夜间
        MyThemeStyle.setupNavigationBarStyle(self, UserDefaults.standard.bool(forKey: isNight))
        // 添加通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
        
        let webView = WKWebView(frame: view.bounds, configuration: WKWebViewConfiguration())
        webView.load(URLRequest(url: URL(string: "https://m.toutiao.com/festival/activity/activity/warmup/landing_page/")!))
        view.addSubview(webView)
    }
    /// 接收到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        // 判断是否是夜间
        MyThemeStyle.setupNavigationBarStyle(self, UserDefaults.standard.bool(forKey: isNight))
    }
}
