//
//  YMNewCareSearchController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/1.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let leftCategoryID = "leftCategoryID"
let rightContentID = "rightContentID"

class YMNewCareSearchController: YMBaseViewController {
    
    /// 左侧分类Table
    @IBOutlet weak var leftCategoryTableView: UITableView!
    /// 右侧内容Table
    @IBOutlet weak var rightContentTableView: UITableView!
    
    
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
        let leftNib = UINib(nibName: String(YMNewCareCategoryCell), bundle: nil)
        leftCategoryTableView.registerNib(leftNib, forCellReuseIdentifier: leftCategoryID)
        let rightNib = UINib(nibName: String(YMNewCareContentCell), bundle: nil)
        rightContentTableView.registerNib(rightNib, forCellReuseIdentifier: rightContentID)
        automaticallyAdjustsScrollViewInsets = false
        leftCategoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        rightContentTableView.contentInset = leftCategoryTableView.contentInset
        leftCategoryTableView.tableFooterView = UIView()
        rightContentTableView.tableFooterView = UIView()
        leftCategoryTableView.rowHeight = 70
        rightContentTableView.rowHeight = 70
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

extension YMNewCareSearchController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == leftCategoryTableView {
            let categoryCell = tableView.dequeueReusableCellWithIdentifier(leftCategoryID) as! YMNewCareCategoryCell
            categoryCell.textLabel?.text = "iOS"
            return categoryCell
        } else {
            let contentCell = tableView.dequeueReusableCellWithIdentifier(rightContentID) as! YMNewCareContentCell
            
            return contentCell
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
}
