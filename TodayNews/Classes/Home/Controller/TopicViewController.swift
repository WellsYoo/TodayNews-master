//
//  TopicViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/11.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import BMPlayer
import SnapKit
import MJRefresh
import SVProgressHUD

class TopicViewController: UIViewController {
    
    /// 播放器
    fileprivate lazy var player = BMPlayer()
    
    fileprivate let disposeBag = DisposeBag()
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
        
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { [weak self] in
            NetworkTool.loadHomeCategoryNewsFeed(category: self!.topicTitle!.category!) { (nowTime, newsTopics) in
                self!.tableView.mj_footer.endRefreshing()
                if newsTopics.count == 0 {
                    SVProgressHUD.setForegroundColor(UIColor.white)
                    SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.3))
                    SVProgressHUD.showInfo(withStatus: "没有更多新闻啦~")
                    return
                }
                self!.newsTopics += newsTopics
                self!.tableView.reloadData()
            }
        })
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
        } else if topicTitle!.category == "essay_joke" { // 段子
            let weitoutiao = newsTopics[indexPath.row]
            return weitoutiao.jokeCellHeight!
        } else if topicTitle!.category == "组图" { // 组图
            let weitoutiao = newsTopics[indexPath.row]
            return weitoutiao.imageCellHeight!
        } else if topicTitle!.category == "image_ppmm" { // 组图
            let weitoutiao = newsTopics[indexPath.row]
            return weitoutiao.girlCellHeight!
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
                    videoDetailVC.videoTopic = cell.videoTopic
                    self!.navigationController!.pushViewController(videoDetailVC, animated: true)
                })
                .addDisposableTo(disposeBag)
            // 播放按钮点击
            cell.bgImageButton.rx.controlEvent(.touchUpInside)
                .subscribe(onNext: { [weak self] in
                    cell.bgImageButton.addSubview(self!.player)
                    self!.player.snp.makeConstraints { (make) in
                        make.edges.equalTo(cell.bgImageButton)
                    }
                    /// 获取视频的真实链接
                    NetworkTool.parseVideoRealURL(video_id: cell.videoTopic!.video_id!) { (realVideo) in
                        self!.player.backBlock = { (isFullScreen) in
                            if isFullScreen == true {
                                return
                            }
                        }
                        let asset = BMPlayerResource(url: URL(string: realVideo.video_1!.main_url!)!, name: cell.titleLabel.text!)
                        self!.player.setVideo(resource: asset)
                    }
                })
                .addDisposableTo(disposeBag)
            return cell
        } else if topicTitle!.category == "subscription" { // 头条号
            let cell = Bundle.main.loadNibNamed(String(describing: ToutiaohaoCell.self), owner: nil, options: nil)?.last as! ToutiaohaoCell
//            cell.myConcern = myConcerns[indexPath.row]
            return cell
        } else if topicTitle!.category == "essay_joke" { // 段子
            let cell = Bundle.main.loadNibNamed(String(describing: HomeJokeCell.self), owner: nil, options: nil)?.last as! HomeJokeCell
            cell.isJoke = true
            cell.joke = newsTopics[indexPath.row]
            return cell
        } else if topicTitle!.category == "组图" { // 组图
            let cell = Bundle.main.loadNibNamed(String(describing:  HomeImageTableCell.self), owner: nil, options: nil)?.last as! HomeImageTableCell
            cell.homeImage = newsTopics[indexPath.row]
            return cell
        } else if topicTitle!.category == "image_ppmm" { // 组图
            let cell = Bundle.main.loadNibNamed(String(describing:  HomeJokeCell.self), owner: nil, options: nil)?.last as! HomeJokeCell
            cell.isJoke = false
            cell.joke = newsTopics[indexPath.row]
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
                let videoTopic = newsTopics[indexPath.row]
                /// 获取视频的真实链接
                NetworkTool.parseVideoRealURL(video_id: videoTopic.video_id!) { (realVideo) in
                    let videoDetailVC = VideoDetailController()
                    videoDetailVC.videoTopic = videoTopic
                    videoDetailVC.realVideo = realVideo
                    self.navigationController?.pushViewController(videoDetailVC, animated: true)
                }
            } else if topicTitle!.category == "subscription" {
                
            } else if topicTitle!.category == "组图" {
                
            } else if topicTitle!.category == "essay_joke" {
                
            } else if topicTitle!.category == "image_ppmm" {
                
            } else {
                let cell = tableView.cellForRow(at: indexPath) as! HomeTopicCell
                let topicDetailVC = TopicDetailController()
                topicDetailVC.weitoutiao = cell.weitoutiao!
    //            topicDetailVC.groupID = String(cell.weitoutiao!.group_id!)
                navigationController?.pushViewController(topicDetailVC, animated: true)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if player.isPlaying { // 说明有正在播放的视频
            let imageButton = player.superview
            let contentView = imageButton?.superview
            let cell = contentView?.superview as! VideoTopicCell
            let rect = tableView.convert(cell.frame, to: view)
            if (rect.origin.y <= -cell.height) || (rect.origin.y >= screenHeight - kTabBarHeight) {
                player.pause()
                player.removeFromSuperview()
            }
        }
    }
}
