//
//  YMVideoTopicController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/5.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  视频显示 cell 的控制器
//

import UIKit
import SnapKit

let videoTopicCellID = "YMVideTopicCell"

class YMVideoTopicController: UITableViewController {

    // 下拉刷新的时间
    private var pullRefreshTime: NSTimeInterval?
    // 记录点击的顶部标题
    var videoTitle: YMVideoTopTitle?
    // 存放新闻主题的数组
    private var newsTopics = [YMNewsTopic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setupRefresh()
    }
    
    private func setupUI() {
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        let nib = UINib(nibName: String(YMVideoTopicCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: videoTopicCellID)
        tableView.rowHeight = 270
        tableView.separatorStyle = .None
    }
    
    /// 添加上拉刷新和下拉刷新
    private func setupRefresh() {
        pullRefreshTime = NSDate().timeIntervalSince1970
        // 获取首页不同分类的新闻内容
        YMNetworkTool.shareNetworkTool.loadHomeCategoryNewsFeed(videoTitle!.category!, tableView: tableView) { [weak self] (nowTime, newsTopics) in
            self!.pullRefreshTime = nowTime
            self!.newsTopics = newsTopics
            self!.tableView.reloadData()
        }
        // 获取更多新闻内容
        YMNetworkTool.shareNetworkTool.loadHomeCategoryMoreNewsFeed(videoTitle!.category!, lastRefreshTime: pullRefreshTime!, tableView: tableView) { [weak self] (moreTopics) in
            self?.newsTopics += moreTopics
            self!.tableView.reloadData()
        }
    }
    
    private lazy var playView: YMPlayerView = {
        let playView = YMPlayerView()
        return playView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YMVideoTopicController: YMVideoTopicCellDelegate {
    
    // MARK: - YMVideoTopicCellDelegate
    /// 昵称按钮点击
    func videoTopicCell(videoTopicCell: YMVideoTopicCell, nameButtonClick nameButton: UIButton) {
        let userVC = YMVideoUserController()
        userVC.mediaInfo = videoTopicCell.videoTopic?.media_info
        navigationController?.pushViewController(userVC, animated: true)
    }
    
    /// 播放按钮点击
    func videoTopicCell(videoTopicCell: YMVideoTopicCell, playButtonClick playButton: UIButton) {
        
    }
    
    /// 背景图片点击
    func videoTopicCell(videoTopicCell: YMVideoTopicCell, tapBgImageViewClick bgImageView: UIImageView) {
        
        bgImageView.addSubview(playView)
        
        playView.snp_makeConstraints { (make) in
            make.edges.equalTo(bgImageView)
        }
        
        
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTopics.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(videoTopicCellID) as! YMVideoTopicCell
        cell.videoTopic = newsTopics[indexPath.row]
        cell.selectionStyle = .None
        cell.delegate = self
        /// 更多按钮点击回调
        cell.moreButtonClosure = {
            YMHomeShareView.show()
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let videoDetailVC = YMVideoDetailController()
        videoDetailVC.videoTopic = newsTopics[indexPath.row]
        navigationController?.pushViewController(videoDetailVC, animated: true)
    }
}
