//
//  VideoTopicControllerViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

let videoTopicCellID = "VideTopicCell"

class VideoTopicController: UITableViewController {

    // 记录点击的顶部标题
    var videoTitle: VideoTopTitle?
    
    // 存放新闻主题的数组
    private var newsTopics = [NewsTopic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        NetworkTool.loadHomeCategoryNewsFeed(category: videoTitle!.category!, tableView: tableView) { (nowTime, newsTopics) in
            self.newsTopics = newsTopics
        }
        
    }
    
    private func setupUI() {
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        let nib = UINib(nibName: "VideoTopicCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: videoTopicCellID)
        tableView.estimatedRowHeight = 235
        tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTopics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: videoTopicCellID) as! VideoTopicCell
        cell.videoTopic = newsTopics[indexPath.row]
        cell.selectionStyle = .none

        /// 更多按钮点击回调

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoDetailVC = VideoDetailController()
//        videoDetailVC.videoTopic = newsTopics[indexPath.row]
        navigationController?.pushViewController(videoDetailVC, animated: true)
    }
    
}
