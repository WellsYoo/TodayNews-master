//
//  YMNewCareSearchController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/1.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMNewCareSearchController: YMBaseViewController {

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    private func setupUI() {
        navigationItem.titleView = searchBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜你关心的"
        return searchBar
    }()
    
}

extension YMNewCareSearchController {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
}
