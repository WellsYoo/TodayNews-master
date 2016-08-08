//
//  YMHomeTopicController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/6.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let topicTableViewCellID = "YMTopicTableViewCell"

class YMHomeTopicController: UITableViewController {
    // 下拉刷新的时间
    private var pullRefreshTime: NSTimeInterval?
    // 记录点击的顶部标题
    var topTitle: YMHomeTopTitle?
    // 存放新闻主题的数组
    var newsTopics = [YMNewsTopic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        // 添加上拉刷新和下拉刷新
        setupRefresh()
    }
    
    private func setupUI() {
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        tableView.registerClass(YMTopicTableViewCell.self, forCellReuseIdentifier: topicTableViewCellID)
        tableView.estimatedRowHeight = 97
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YMHomeTopicController {
    
    /// 添加上拉刷新和下拉刷新
    private func setupRefresh() {
        pullRefreshTime = NSDate().timeIntervalSince1970
        // 获取首页不同分类的新闻内容
        YMNetworkTool.shareNetworkTool.loadHomeCategoryNewsFeed(topTitle!.category!, tableView: tableView) { [weak self] (nowTime, newsTopics) in
            self!.pullRefreshTime = nowTime
            self!.newsTopics = newsTopics
            self!.tableView.reloadData()
        }
        // 获取更多新闻内容
        YMNetworkTool.shareNetworkTool.loadHomeCategoryMoreNewsFeed(topTitle!.category!, lastRefreshTime: pullRefreshTime!, tableView: tableView) { [weak self] (moreTopics) in
            self?.newsTopics += moreTopics
            self!.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTopics.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(topicTableViewCellID) as! YMTopicTableViewCell
        cell.newsTopic = newsTopics[indexPath.row]
        /// 举报按钮点击回调
        cell.closeButtonClick { (filterWords) in
            let popVC = YMHomePopController()
            self.navigationController?.pushViewController(popVC, animated: true)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let newsTopic = newsTopics[indexPath.row]
        return newsTopic.cellHeight
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}


