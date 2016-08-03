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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var titleView: YMTitleView = {
        let titleView = YMTitleView.titleView()
        titleView.delegate = self
        titleView.imageName = "search_topic_24x24_"
//        YMNetworkTool.shareNetworkTool.loadHomeTitlesData({ (topTitles) in
//            titleView.titles = topTitles
//            titleView.titleCollectionView.reloadData()
//        })
        return titleView
    }()
    
}

extension YMHomeViewController: YMTitleViewDelegate {
    
    
    
    // MARK: - YMTitleViewDelegate
    func titleView(titleView: YMTitleView, titleButton button: UIButton) {
        let addTopicVC = YMAddTopicViewController()
        let nav = YMNavigationController(rootViewController: addTopicVC)
        presentViewController(nav, animated: false, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    
}