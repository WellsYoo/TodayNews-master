//
//  YMHomeTopicController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/6.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let topicSmallCellID = "YMHomeSmallCell"
let topicMiddleCellID = "YMHomeMiddleCell"
let topicLargeCellID = "YMHomeLargeCell"
let topicNoImageCellID = "YMHomeNoImageCell"

class YMHomeTopicController: UITableViewController {
    
    // 下拉刷新的时间
    private var pullRefreshTime: NSTimeInterval?
    // 记录点击的顶部标题
    var topTitle: YMHomeTopTitle?
    // 存放新闻主题的数组
    private var newsTopics = [YMNewsTopic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        // 添加上拉刷新和下拉刷新
        setupRefresh()
    }
    
    private func setupUI() {
        self.definesPresentationContext = true
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 49, 0)
        // 注册 cell
        tableView.registerClass(YMHomeSmallCell.self, forCellReuseIdentifier: topicSmallCellID)
        tableView.registerClass(YMHomeMiddleCell.self, forCellReuseIdentifier: topicMiddleCellID)
        tableView.registerClass(YMHomeLargeCell.self, forCellReuseIdentifier: topicLargeCellID)
        tableView.registerClass(YMHomeNoImageCell.self, forCellReuseIdentifier: topicNoImageCellID)
        // 预设定 cell 的高度为 97
        tableView.estimatedRowHeight = 97
        tableView.tableHeaderView = homeSearchBar
    }
    
    private lazy var homeSearchBar: YMHomeSearchBar = {
        let homeSearchBar = YMHomeSearchBar()
        homeSearchBar.searchBar.delegate = self
        homeSearchBar.frame = CGRectMake(0, 0, SCREENW, 44)
        return homeSearchBar
    }()
    
//    private lazy var searchController: UISearchController = {
//        let searchController = UISearchController(searchResultsController: nil)
////        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = true
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.searchBar.placeholder = "搜索"
//        searchController.searchBar.barTintColor = YMGlobalColor()
//        searchController.searchBar.sizeToFit()
//        return searchController
//    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YMHomeTopicController: UITextFieldDelegate {
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // 创建搜索内容控制器
        let searchContentVC = YMSearchContentViewController()
//        searchContentVC.delegate = self
        let nav = YMNavigationController(rootViewController: searchContentVC)
        presentViewController(nav, animated: false, completion: nil)
        return true
    }
    
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
        tableView.tableViewNoDataOrNewworkFail(newsTopics.count)
        return newsTopics.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let newsTopic = newsTopics[indexPath.row]
        let tableViewSuperView = tableView.superview
        
        if newsTopic.image_list.count != 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(topicSmallCellID) as! YMHomeSmallCell
            cell.newsTopic = newsTopic
            cell.closeButtonClick({ (filterWords) in
                let buttonRect = cell.closeButton.convertRect(cell.closeButton.frame, fromView: tableViewSuperView!.superview)
                // < -517 的时候，尖角在下面
                YMPopView.show(filterWords, topY: buttonRect.minY)
            })
            return cell
        } else {
            if newsTopic.middle_image?.height != nil {
                if newsTopic.video_detail_info?.video_id != nil || newsTopic.large_image_list.count != 0 {
                    let cell = tableView.dequeueReusableCellWithIdentifier(topicLargeCellID) as! YMHomeLargeCell
                    cell.newsTopic = newsTopic
                    cell.closeButtonClick({ (filterWords) in
                        let buttonRect = cell.closeButton.convertRect(cell.closeButton.frame, fromView: tableViewSuperView!.superview)
                        // < -517 的时候，尖角在下面
                        YMPopView.show(filterWords, topY: buttonRect.minY)
                    })
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCellWithIdentifier(topicMiddleCellID) as! YMHomeMiddleCell
                    cell.newsTopic = newsTopic
                    cell.closeButtonClick({ (filterWords) in
                        let buttonRect = cell.closeButton.convertRect(cell.closeButton.frame, fromView: tableViewSuperView!.superview)
                        // < -517 的时候，尖角在下面
                        YMPopView.show(filterWords, topY: buttonRect.minY)
                    })
                    return cell
                }
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier(topicNoImageCellID) as! YMHomeNoImageCell
                cell.newsTopic = newsTopic
                cell.closeButtonClick({ (filterWords) in
                    let buttonRect = cell.closeButton.convertRect(cell.closeButton.frame, fromView: tableViewSuperView!.superview)
                    // < -517 的时候，尖角在下面
                    YMPopView.show(filterWords, topY: buttonRect.minY)
                })
                return cell
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let newsTopic = newsTopics[indexPath.row]
        return newsTopic.cellHeight
    }
    
    // MARK: - UITableViewDeleagte
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let homeDetailVC = YMHomeDetailController()
        homeDetailVC.newsTopic = newsTopics[indexPath.row]
        navigationController?.pushViewController(homeDetailVC, animated: true)
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -20 {
            scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        }
    }
    
}


