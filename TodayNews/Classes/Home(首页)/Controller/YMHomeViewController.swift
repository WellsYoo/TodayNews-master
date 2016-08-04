//
//  YMHomeViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMHomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = YMGlobalColor()
        navigationItem.title = ""
        navigationItem.titleView = titleView
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = YMColor(210, g: 63, b: 66, a: 1.0)
        
        titleView.addButtonClickClosure { [weak self] in
            let addTopicVC = YMAddTopicViewController()
            let nav = YMNavigationController(rootViewController: addTopicVC)
            self!.presentViewController(nav, animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 顶部标题
    private lazy var titleView: YMScrollTitleView = {
        let titleView = YMScrollTitleView()
        return titleView
    }()
    
}

extension YMHomeViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    
}