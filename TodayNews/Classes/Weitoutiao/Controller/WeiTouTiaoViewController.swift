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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        NetworkTool.loadWeiTouTiaoData()
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
        tableView.rowHeight = 300
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
        notNetworkView.isHidden = true
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
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeiTouTiaoCell", for: indexPath)
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
