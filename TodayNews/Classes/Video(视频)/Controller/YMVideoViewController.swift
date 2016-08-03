//
//  YMVideoViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMVideoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        navigationItem.title = ""
        navigationItem.titleView = titleView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var titleView: YMTitleView = {
        let titleView = YMTitleView.titleView()
        titleView.delegate = self
        titleView.imageName = "search_topic_24x24_"
        YMNetworkTool.shareNetworkTool.loadVideoTitlesData({ (topTitles) in
            titleView.titles = topTitles
            titleView.titleCollectionView.reloadData()
        })
        return titleView
    }()
}

extension YMVideoViewController: YMTitleViewDelegate {
    func titleView(titleView: YMTitleView, titleButton button: UIButton) {
        let searchVC = YMVideoSearchController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}
