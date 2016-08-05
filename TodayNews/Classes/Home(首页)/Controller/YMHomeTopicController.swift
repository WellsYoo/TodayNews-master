//
//  YMHomeTopicControllerTableViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/4.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let topicTableViewCellID = "YMTopicTableViewCell"

class YMHomeTopicController: UITableViewController {
    // 记录点击的顶部标题
    var topTitle: YMHomeTopTitle?
    // 存放新闻主题的数组
    var newsTopics = [YMNewsTopic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        let nib = UINib(nibName: String(YMTopicTableViewCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: topicTableViewCellID)
        // 获取首页不同分类的新闻内容
        YMNetworkTool.shareNetworkTool.loadHomeCategoryNewsFeed("news_hot") { [weak self] (newsTopics) in
            self!.newsTopics = newsTopics
            self!.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

extension YMHomeTopicController {
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTopics.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(topicTableViewCellID) as! YMTopicTableViewCell
        cell.textLabel?.text = newsTopics[indexPath.row].title!
        return cell
    }
    
}
