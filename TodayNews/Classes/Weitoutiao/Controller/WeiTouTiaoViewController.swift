//
//  NewCareViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hrscy. All rights reserved.
//
// 3.关注 控制器

import UIKit
import SnapKit

class WeiTouTiaoViewController: UIViewController {
    /// 微头条数据
    fileprivate var microNews = [WeiTouTiao]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        /// 获取微头条数据
        NetworkTool.loadWeiTouTiaoData { (weitoutiaos) in
            self.notNetworkView.isHidden = weitoutiaos.count != 0 ? true : false
            self.microNews = weitoutiaos
            self.tableView.reloadData()
        }
    }

    fileprivate lazy var headerView: WeitoutiaoHeaderView = {
        let headerView = WeitoutiaoHeaderView.headerView()
        headerView.delegate = self
        return headerView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: String(describing: WeiTouTiaoCell.self), bundle: nil), forCellReuseIdentifier: "WeiTouTiaoCell")
        return tableView
    }()
    
    /// 没有数据时显示
    lazy var notNetworkView: NotNetworkView = {
        let notNetworkView = NotNetworkView.noNetworkView()
        return notNetworkView
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WeiTouTiaoViewController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        view.addSubview(bgView)
        bgView.addSubview(headerView)
        bgView.addSubview(tableView)
        bgView.addSubview(notNetworkView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
            make.bottom.equalTo(view).offset(-kTabBarHeight)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(bgView)
            make.height.equalTo(kWeiTouTiaoHeaderHieght)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.left.bottom.right.equalTo(bgView)
        }
        
        notNetworkView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(bgView)
            make.top.equalTo(headerView.snp.bottom)
        }
    }
}

// MARK: - 顶部 头部 WeitoutiaoHeaderViewDelegate
extension WeiTouTiaoViewController: WeitoutiaoHeaderViewDelegate {
    // 文字按钮点击了
    func headerViewTextButtonClicked() {
        let storyboard = UIStoryboard(name: "WeiTouTiaoHeader", bundle: nil)
        let textVC = storyboard.instantiateViewController(withIdentifier: "TextNavigationController") as! MyNavigationController
        present(textVC, animated: true, completion: nil)
    }
    
    // 图片按钮点击了
    func headerViewImageButtonClicked() {
        
    }
    
    // 视频按钮点击了
    func headerViewVideoButtonClicked() {
        
    }
}

// MARK: - UITableViewDelegate
extension WeiTouTiaoViewController: UITableViewDelegate, UITableViewDataSource {
    /// UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return microNews.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let weitoutiao = microNews[indexPath.row]
        return weitoutiao.cellH!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeiTouTiaoCell") as! WeiTouTiaoCell
        cell.weitoutiao = microNews[indexPath.row]
        cell.delegate = self
        // 使用闭包
//        cell.headerButtonClick = {
//            let userVC = WeiTouTiaoUserController()
//            self.navigationController?.pushViewController(userVC, animated: true)
//        }
        return cell
    }
    
    /// UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if case 0...kWeiTouTiaoHeaderHieght = offsetY { // 向上滑动
            bgView.snp.updateConstraints({ (make) in
                make.top.equalTo(view).offset(kNavBarHeight - offsetY)
            })
        } else if offsetY > kWeiTouTiaoHeaderHieght {
            bgView.snp.updateConstraints({ (make) in
                make.top.equalTo(view).offset(-kWeiTouTiaoHeaderHieght)
            })
        }
    }
}

// MARK: - WeitoutiaoCellDelegate cell
extension WeiTouTiaoViewController: WeitoutiaoCellDelegate {
    
    /// cell 顶部用户名区域点击
    func weiTouTiaoCellofHeaderButtonClicked() {
        let userVC = WeiTouTiaoUserController()
        navigationController?.pushViewController(userVC, animated: true)
    }
    
    /// 转发按钮点击
    func weiTouTiaoCelloffeedShareButtonClicked(weitoutiaoCell: WeiTouTiaoCell) {
        let storyboard = UIStoryboard(name: "WeiTouTiaoHeader", bundle: nil)
        let feedShareVC = storyboard.instantiateViewController(withIdentifier: "FeedShareViewController") as! FeedShareViewController
        let weitoutiao = weitoutiaoCell.weitoutiao
        if weitoutiao!.title!.isEqual(to: "") {
            feedShareVC.content = String(describing: weitoutiao!.content!)
        } else {
            feedShareVC.content = String(describing: weitoutiao!.title!)
        }
        if let video_detail_info = weitoutiao?.video_detail_info {
            let detail_video_large_image = video_detail_info.detail_video_large_image
            feedShareVC.thumbImageURL = detail_video_large_image?.url
        }
        let navigationVC = MyNavigationController(rootViewController: feedShareVC)
        present(navigationVC, animated: true, completion: nil)
    }
}
