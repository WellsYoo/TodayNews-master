//
//  VideoTopicControllerViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

class VideoTopicController: UIViewController {

    // 记录点击的顶部标题
    var videoTitle: VideoTopTitle?
    // 存放新闻主题的数组
    fileprivate var newsTopics = [NewsTopic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        NetworkTool.loadHomeCategoryNewsFeed(category: videoTitle!.category!) { (nowTime, newsTopics) in
            self.newsTopics = newsTopics
//            self.tableView.reloadData()
        }
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 232
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "VideoTopicCell", bundle: nil), forCellReuseIdentifier: "VideoTopicCell")
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        return tableView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension VideoTopicController {
    
    fileprivate func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }
}

// MARK: - Table view data source
extension VideoTopicController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTopicCell.self)) as! VideoTopicCell
//        cell.videoTopic = newsTopics[indexPath.row]
        /// 更多按钮点击回调
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoDetailVC = VideoDetailController()
        //        videoDetailVC.videoTopic = newsTopics[indexPath.row]
        navigationController?.pushViewController(videoDetailVC, animated: true)
    }
}
