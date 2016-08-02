//
//  YMNewCareViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  关注界面
//

import UIKit


let newCareTopCellID = "YMNewCareNoLoginCell"
let newCareBottomCellID = "YMNewCareBottomCell"

class YMNewCareViewController: YMBaseViewController {

    var tableView: UITableView?
    
    var concerns = [YMConcern]()
    
    var offset: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置 UI
        setupUI()
        // 上拉和下拉加载数据
        setupRefresh()
    }
    
    /// 上拉和下拉加载数据
    private func setupRefresh() {
        YMNetworkTool.shareNetworkTool.loadNewConcernList(tableView!) { (concerns) in
            self.concerns = concerns
            self.tableView!.reloadData()
        }
        
        YMNetworkTool.shareNetworkTool.loadMoreConcernList(tableView!, outOffset: offset) { (inOffset, concerns) in
            self.concerns += concerns
            self.offset = inOffset
            self.tableView!.reloadData()
        }
        
    }
    
    // 设置 UI
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_topic_24x24_"), style: .Plain, target: self, action: #selector(searchBBItemClick))
        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        let topNib = UINib(nibName: String(YMNewCareNoLoginCell), bundle: nil)
        tableView.registerNib(topNib, forCellReuseIdentifier: newCareTopCellID)
        let bottomNib = UINib(nibName: String(YMNewCareBottomCell), bundle: nil)
        tableView.registerNib(bottomNib, forCellReuseIdentifier: newCareBottomCellID)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 67
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        tableView.sectionFooterHeight = kMargin
        view.addSubview(tableView)
        self.tableView = tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBBItemClick() {
        let searchVC = YMNewCareSearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

extension YMNewCareViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return concerns.count ?? 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // 正在关心
            let cell = tableView.dequeueReusableCellWithIdentifier(newCareTopCellID) as! YMNewCareNoLoginCell
            return cell
        } else { // 可能关心
            let cell = tableView.dequeueReusableCellWithIdentifier(newCareBottomCellID) as! YMNewCareBottomCell
            cell.concern = concerns[indexPath.row]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = YMCareheaderView()
        if section == 0 {
            headerView.title = "正在关心"
            return headerView
        } else {
            headerView.title = "可能关心"
            return headerView
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
