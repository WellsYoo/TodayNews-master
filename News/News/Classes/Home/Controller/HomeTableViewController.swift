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
    
    private lazy var disposeBag = DisposeBag()
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
        tableView.ym_registerCell(cell: HomeUserCell.self)
        tableView.ym_registerCell(cell: TheyAlsoUseCell.self)
        tableView.ym_registerCell(cell: HomeJokeCell.self)
        tableView.ym_registerCell(cell: HomeImageTableCell.self)
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
        let aNews = news[indexPath.row]
        switch newsTitle.category {
        case .essayJoke:
            return aNews.jokeCellHeight
        case .photos:
            return aNews.imageCellHeight
        case .imagePPMM:
            return aNews.girlCellHeight
        default:
            switch aNews.cell_type {
            case .user:
                return aNews.contentH
            case .relatedConcern:
                return 290
            case .none:
                return aNews.cellHeight
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch newsTitle.category {
        case .essayJoke:            // 段子
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeJokeCell
            cell.isJoke = true
            cell.joke = news[indexPath.row]
            return cell
        case .photos:               // 图片,组图
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeImageTableCell
            cell.homeImage = news[indexPath.row]
            return cell
        case .imagePPMM:            // 街拍
            let cell = Bundle.main.loadNibNamed(String(describing: HomeJokeCell.self), owner: nil, options: nil)?.last as! HomeJokeCell
            cell.isJoke = false
            cell.joke = news[indexPath.row]
            return cell
        default:
            let aNews = news[indexPath.row]
            switch aNews.cell_type {
            case .user:             // 用户
                let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeUserCell
                cell.aNews = aNews
                return cell
            case .relatedConcern:   // 相关关注
                let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as TheyAlsoUseCell
                cell.theyUse = aNews.raw_data
                return cell
            case .none:
                let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeCell
                cell.aNews = aNews
                return cell
            }
        }
    }
}
