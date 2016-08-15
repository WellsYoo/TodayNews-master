//
//  YMActivityController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/15.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  活动界面
//

import UIKit

class YMActivityController: UIViewController {
    
    let urlString = BASE_URL + "2/wap/activity/?iid=5124013949"
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "new_more_titlebar_28x28_"), style: .Plain, target: self, action: #selector(activityBBItemClick))
        
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    /// 活动界面更多按钮
    func activityBBItemClick() {
        let alertController = UIAlertController(title: "非Wifi网络流量", message: nil, preferredStyle: .ActionSheet)
        let refreshAction = UIAlertAction(title: "刷新", style: .Default, handler: { (_) in
            self.webView.reload()
        })
        let copyLinkAction = UIAlertAction(title: "复制链接", style: .Default, handler: { (_) in
            // 复制到剪贴板
            let pasteboard = UIPasteboard.generalPasteboard()
            pasteboard.string = self.urlString
        })
        let safariAction = UIAlertAction(title: "使用Safari打开", style: .Default, handler: { (_) in
            if UIApplication.sharedApplication().canOpenURL(NSURL(string: self.urlString)!) {
                UIApplication.sharedApplication().openURL(NSURL(string: self.urlString)!)
            }
        })
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alertController.addAction(refreshAction)
        alertController.addAction(copyLinkAction)
        alertController.addAction(safariAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMActivityController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}
