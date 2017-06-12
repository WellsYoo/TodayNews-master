//
//  MineViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hrscy. All rights reserved.
//
// 4.我的 控制器

import UIKit

class MineViewController: UITableViewController, UINavigationControllerDelegate {

    var bgImageViewHeight: CGFloat = 0
    var bgImageViewWidth: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        
        tableView.rowHeight = 40
        tableView.tableHeaderView = noLoginHeaderView
        bgImageViewHeight = noLoginHeaderView.bgImageView.height
        bgImageViewWidth = noLoginHeaderView.bgImageView.width
        tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
        tableView.tableFooterView = UIView()
        
    }

    lazy var noLoginHeaderView: NoLoginHeaderView = {
        let noLoginHeaderView = NoLoginHeaderView.headerView()
        return noLoginHeaderView
    }()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        if indexPath.section == 0 {
            cell.textLabel?.text = "消息通知"
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "头条商城"
                cell.detailTextLabel?.text = "邀请好友得200元现金奖励"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "京东特供"
                cell.detailTextLabel?.text = "新人领188元红包"
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "我要爆料"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "用户反馈"
            } else if indexPath.row == 2 {
                cell.textLabel?.text = "系统设置"
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0{
            var tempFrame = noLoginHeaderView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = bgImageViewHeight - offsetY
            tempFrame.size.width = bgImageViewWidth - offsetY
            noLoginHeaderView.bgImageView.frame = tempFrame
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MineViewController {
    
    
}
