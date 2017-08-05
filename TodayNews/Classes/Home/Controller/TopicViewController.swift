//
//  TopicViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController {

    // 记录点击的顶部标题
    var topicTitle: TopicTitle?
    
    // 存放新闻主题的数组
    fileprivate var newsTopics = [WeiTouTiao]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        if self.topicTitle!.category == "subscription" { // 头条号
            tableView.tableHeaderView = toutiaohaoHeaderView
        }
        
        NetworkTool.loadHomeCategoryNewsFeed(category: topicTitle!.category!) { (nowTime, newsTopics) in
            self.newsTopics = newsTopics
            self.tableView.reloadData()
        }
    }
    
    fileprivate  lazy var toutiaohaoHeaderView: ToutiaohaoHeaderView = {
        let toutiaohaoHeaderView = ToutiaohaoHeaderView()
        toutiaohaoHeaderView.height = 56
        toutiaohaoHeaderView.delegate = self
        return toutiaohaoHeaderView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 232
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0)
//        tableView.register(UINib(nibName: String(describing: HomeTopicCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HomeTopicCell.self))
//        tableView.register(UINib(nibName: String(describing: VideoTopicCell.self), bundle: nil), forCellReuseIdentifier: String(describing: VideoTopicCell.self))
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        return tableView
    }()
    
}

extension TopicViewController: ToutiaohaoHeaderViewDelegate {
    
    func toutiaohaoHeaderViewMoreConcernButtonClicked() {
        navigationController?.pushViewController(ConcernToutiaohaoController(), animated: true)
    }
    
}

extension TopicViewController {
    fileprivate func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }
}

// MARK: - Table view data source
extension TopicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if topicTitle!.category == "video" {
            return screenHeight * 0.4
        } else if topicTitle!.category == "subscription" { // 头条号
            return 68
        }
        let weitoutiao = newsTopics[indexPath.row]
        return weitoutiao.homeCellHeight!
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if topicTitle!.category == "subscription" {
            return 10
        } else {
            return newsTopics.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if topicTitle!.category == "video" { // 视频
            let cell = Bundle.main.loadNibNamed(String(describing: VideoTopicCell.self), owner: nil, options: nil)?.last as! VideoTopicCell
            cell.videoTopic = newsTopics[indexPath.row]
            cell.delegate = self
            return cell
        } else if topicTitle!.category == "subscription" { // 头条号
            let cell = Bundle.main.loadNibNamed(String(describing: ToutiaohaoCell.self), owner: nil, options: nil)?.last as! ToutiaohaoCell
//            cell.myConcern = myConcerns[indexPath.row]
            return cell
        }
        let cell = Bundle.main.loadNibNamed(String(describing: HomeTopicCell.self), owner: nil, options: nil)?.last as! HomeTopicCell
        cell.weitoutiao = newsTopics[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 && topicTitle!.category == "" { // 默认设置点击第一个 cell 跳转到图片详情界面
            let cell = tableView.cellForRow(at: indexPath) as! HomeTopicCell
            let storyboard = UIStoryboard(name: "NewsDetailImageController", bundle: nil)
            let newsDetailImageVC = storyboard.instantiateViewController(withIdentifier: "NewsDetailImageController") as! NewsDetailImageController
            newsDetailImageVC.weitoutiao = cell.weitoutiao
            present(newsDetailImageVC, animated: false, completion: nil)
        } else {
            if topicTitle!.category == "video" {
                let videoDetailVC = VideoDetailController()
                //        videoDetailVC.videoTopic = newsTopics[indexPath.row]
                navigationController?.pushViewController(videoDetailVC, animated: true)
            } else if topicTitle!.category == "subscription" {
                
            } else {
                let cell = tableView.cellForRow(at: indexPath) as! HomeTopicCell
                let topicDetailVC = TopicDetailController()
                topicDetailVC.weitoutiao = cell.weitoutiao!
    //            topicDetailVC.groupID = String(cell.weitoutiao!.group_id!)
                navigationController?.pushViewController(topicDetailVC, animated: true)
            }
        }
    }
}

extension TopicViewController: VideoTopicCellDelegate {
    /// 头像区域点击了
    func videoheadTopicCellButtonClick(videoTopic: WeiTouTiao) {
        let userVC = FollowDetailViewController()
        userVC.userid = videoTopic.media_info!.user_id!
        navigationController?.pushViewController(userVC, animated: true)
    }
}
