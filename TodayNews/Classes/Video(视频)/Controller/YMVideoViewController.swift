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
        titleView.searchButtonClickClosure { [weak self] in
            let videoSearchVC = YMVideoSearchController()
            self!.navigationController?.pushViewController(videoSearchVC, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var titleView: YMVideoTitleView = {
        let titleView = YMVideoTitleView()
        return titleView
    }()
}

extension YMVideoViewController {
    
}
