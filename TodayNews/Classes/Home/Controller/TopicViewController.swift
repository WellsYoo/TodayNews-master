//
//  HomeTopViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

class HomeTopViewController: UIViewController {

    // 记录点击的顶部标题
    var homeTopTitle: HomeTopTitle?
    var fromController: String? {
        didSet {
            if fromController == String(describing: HomeViewController.self) {
                tableView.register(UINib(nibName: String(describing: HomeTopicCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HomeTopicCell.self))
            } else {
                tableView.register(UINib(nibName: String(describing: VideoTopicCell.self), bundle: nil), forCellReuseIdentifier: String(describing: VideoTopicCell.self))
            }
        }
    }
    
    // 存放新闻主题的数组
    fileprivate var newsTopics = [WeiTouTiao]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        NetworkTool.loadHomeCategoryNewsFeed(category: homeTopTitle!.category!) { (nowTime, newsTopics) in
            self.newsTopics = newsTopics
            self.tableView.reloadData()
        }
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 232
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        return tableView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeTopViewController {
    fileprivate func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }
}

// MARK: - Table view data source
extension HomeTopViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if fromController  == String(describing: HomeViewController.self) {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTopicCell.self)) as! HomeTopicCell
            cell.weitoutiao = newsTopics[indexPath.row]
            //        cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTopicCell.self)) as! VideoTopicCell
            cell.videoTopic = newsTopics[indexPath.row]
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoDetailVC = VideoDetailController()
        //        videoDetailVC.videoTopic = newsTopics[indexPath.row]
        navigationController?.pushViewController(videoDetailVC, animated: true)
    }
}

extension HomeTopViewController: VideoTopicCellDelegate {
    /// 头像区域点击了
    func videoheadTopicCellButtonClick(videoTopic: WeiTouTiao) {
        let userVC = FollowDetailViewController()
        userVC.userid = videoTopic.media_info!.user_id!
        navigationController?.pushViewController(userVC, animated: true)
    }
}
