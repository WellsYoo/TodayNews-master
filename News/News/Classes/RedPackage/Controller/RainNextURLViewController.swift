//
//  RainNextURLViewController.swift
//  News
//
//  Created by 杨蒙 on 2018/2/5.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import WebKit

class RainNextURLViewController: UIViewController {

    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_clear"), for: .default)
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "personal_home_back_white_24x24_"), style: .plain, target: self, action: #selector(goBack))
        navigationController?.navigationBar.barStyle = .black
        let webView = WKWebView(frame: view.bounds, configuration: WKWebViewConfiguration())
        webView.load(URLRequest(url: URL(string: url)!))
        view.addSubview(webView)
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
