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
import AVFoundation

let videoTopicCellID = "YMVideTopicCell"
/// ![](http://obna9emby.bkt.clouddn.com/news/topicVC.png)
class YMVideoTopicController: UITableViewController {
    
    var lastSelectCell: YMVideoTopicCell?
    
    var playView: YMPlayerView?
    
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
    
    /// 背景按钮点击
    func videoTopicCell(videoTopicCell: YMVideoTopicCell, bgImageButtonClick bgImageButton: UIButton) {
        if lastSelectCell != nil {
            // 上次选中的 cell
            lastSelectCell?.playButton.hidden = false
            lastSelectCell?.playButton.selected = false
            lastSelectCell?.titleLabel.hidden = false
            lastSelectCell?.timeLabel.hidden = false
            lastSelectCell?.loadingImageView.hidden = true
            playView!.removeFromSuperview()
        }
        
        // 当前选中的 cell
        videoTopicCell.titleLabel.hidden = true
        videoTopicCell.playButton.hidden = true
        videoTopicCell.timeLabel.hidden = true
        
        let playerView = YMPlayerView()
        bgImageButton.addSubview(playerView)
        playView = playerView
        
        playerView.snp_makeConstraints { (make) in
            make.edges.equalTo(bgImageButton)
        }
        
        // 添加视频链接
        // 说明：今日头条的返回的视频是一个网址，但是获取不到视频的真实地址，所以用了一个视频来代替返回数据，
        // 另外，还请大家不要吐槽这个视频，毕竟现在的视频全是『宝宝』的视频。。(˶‾᷄ ⁻̫ ‾᷅˵)
        // 嗯嗯，一切为了技术~ ୧( ⁼̴̶̤̀ω⁼̴̶̤́ )૭
        let item = AVPlayerItem(URL: NSURL(string: "http://wvideo.spriteapp.cn/video/2016/0817/57b3bc156c6ef_wpd.mp4")!)
        
        playerView.playerItem = item
        
        // 覆盖按钮点击
        playerView.coverButtonClosure = { (coverButton) in
            videoTopicCell.titleLabel.hidden = !coverButton.selected
        }
        
        addAnimation(videoTopicCell.loadingImageView)
        lastSelectCell = videoTopicCell
    }
    
    /// 添加动画
    func addAnimation(loading: UIImageView) {
        loading.hidden = false
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1
        // 绕 z 轴旋转 180°
        animation.toValue = M_PI * 2.0
        animation.cumulative = true
        animation.removedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        // 如果是在 OC 里，应这样写 animation.repeatCount = HUGE_VALF;
        animation.repeatCount = Float.infinity
        animation.fillMode = kCAFillModeForwards
        loading.layer.addAnimation(animation, forKey: animation.keyPath)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            loading.layer.removeAllAnimations()
            loading.hidden = true
            self.playView!.playButton.selected = true
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
