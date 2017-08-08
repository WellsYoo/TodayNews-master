//
//  VideoTopicControllerViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class VideoTopicController: UIViewController {
    fileprivate let disposeBag = DisposeBag()
    
    // 记录点击的顶部标题
    var videoTitle: TopicTitle?
    // 存放新闻主题的数组
    fileprivate var newsTopics = [WeiTouTiao]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        NetworkTool.loadHomeCategoryNewsFeed(category: videoTitle!.category!) { (nowTime, newsTopics) in
            self.newsTopics = newsTopics
            self.tableView.reloadData()
        }
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.rowHeight = screenHeight * 0.4
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: VideoTopicCell.self), bundle: nil), forCellReuseIdentifier: String(describing: VideoTopicCell.self))
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        return tableView
    }()
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
        return newsTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTopicCell.self)) as! VideoTopicCell
        cell.videoTopic = newsTopics[indexPath.row]
        // 头像区域点击
        cell.headCoverButton.rx.controlEvent(.touchUpInside)
                               .subscribe(onNext: { [weak self] in
                                    let userVC = FollowDetailViewController()
                                    userVC.userid = cell.videoTopic!.media_info!.user_id!
                                    self!.navigationController!.pushViewController(userVC, animated: true)
                               })
                               .addDisposableTo(disposeBag)
        // 评论按钮点击
        cell.commentButton.rx.controlEvent(.touchUpInside)
                            .subscribe(onNext: { [weak self] in
                                let videoDetailVC = VideoDetailController()
                                videoDetailVC.item_id = cell.videoTopic!.item_id!
                                videoDetailVC.group_id = cell.videoTopic!.group_id!
                                self!.navigationController!.pushViewController(videoDetailVC, animated: true)
                            })
                            .addDisposableTo(disposeBag)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoDetailVC = VideoDetailController()
        //        videoDetailVC.videoTopic = newsTopics[indexPath.row]
        navigationController?.pushViewController(videoDetailVC, animated: true)
    }
}
