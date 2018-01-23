//
//  HomeTableViewController.swift
//  News
//
//  Created by 杨蒙 on 2018/1/17.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import SVProgressHUD
import RxSwift
import RxCocoa
import BMPlayer
import NVActivityIndicatorView
import SnapKit

class HomeTableViewController: UITableViewController {
    /// 播放器
    private lazy var player: BMPlayer = BMPlayer(customControlView: VideoPlayerCustomView())
    /// 标题
    var newsTitle = HomeNewsTitle()
    /// 视频数据
    var news = [NewsModel]()
    /// 刷新时间
    private var maxBehotTime: TimeInterval = 0.0
    /// 视频真实地址
    private var realVideo = RealVideo()
    /// 上一次播放的 cell
    private var priorCell: VideoCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.configuration()
        // 注册视频的 cell
        tableView.ym_registerCell(cell: VideoCell.self)
        tableView.ym_registerCell(cell: HomeCell.self)
        tableView.tableFooterView = UIView()
        tableView.theme_separatorColor = "colors.separatorViewColor"
        // 设置刷新控件
        setupRefresh()
    }
    
    /// 设置刷新控件
    private func setupRefresh() {
        // 刷新头部
        let header = RefreshHeader { [weak self] in
            // 获取视频的新闻列表数据
            NetworkTool.loadApiNewsFeeds(category: self!.newsTitle.category, ttFrom: .pull, {
                if self!.tableView.mj_header.isRefreshing { self!.tableView.mj_header.endRefreshing() }
                self!.maxBehotTime = $0
                self!.news = $1
                self!.tableView.reloadData()
            })
        }
        header?.isAutomaticallyChangeAlpha = true
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView.mj_header = header
        tableView.mj_header.beginRefreshing()
        // 底部刷新控件
        tableView.mj_footer = RefreshAutoGifFooter(refreshingBlock: { [weak self] in
            // 获取视频的新闻列表数据，加载更多
            NetworkTool.loadMoreApiNewsFeeds(category: self!.newsTitle.category, ttFrom: .loadMore, maxBehotTime: self!.maxBehotTime, listCount: self!.news.count, {
                if self!.tableView.mj_footer.isRefreshing { self!.tableView.mj_footer.endRefreshing() }
                self!.tableView.mj_footer.pullingPercent = 0.0
                if $0.count == 0 {
                    SVProgressHUD.showInfo(withStatus: "没有更多数据啦！")
                    return
                }
                self!.news += $0
                self!.tableView.reloadData()
            })
        })
        tableView.mj_footer.isAutomaticallyChangeAlpha = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - Table view data source
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if newsTitle.category == .video { return screenWidth * 0.67 }
        else if newsTitle.category == .essayJoke { return screenWidth * 0.67 }
        
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if newsTitle.category == .video { // 如果是视频
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as VideoCell
            cell.video = news[indexPath.row]
            return cell
        } else {
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeCell
            cell.aNews = news[indexPath.row]
            return cell
        }
        
    }
    
}
