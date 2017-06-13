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
    }

    fileprivate lazy var headerView: WeitoutiaoHeaderView = {
        let headerView = WeitoutiaoHeaderView.headerView()
        return headerView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
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
    }
    
}

// MARK: - 顶部 头部
extension WeiTouTiaoViewController {
    // 文字按钮点击了
    @IBAction func textButtonClicked() {
        
    }
    
    // 图片按钮点击了
    @IBAction func imageButtonClicked() {
        
    }
    
    // 视频按钮点击了
    @IBAction func videoButtonClicked() {
        
    }
}

// MARK: - UITableViewDelegate
extension WeiTouTiaoViewController: UITableViewDelegate, UITableViewDataSource {
    /// UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "WeiTouTiaoCell")
        cell.textLabel?.text = "asda"
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
