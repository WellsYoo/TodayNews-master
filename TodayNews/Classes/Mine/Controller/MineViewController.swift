//
//  MineViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/13.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import IBAnimatable

class MineViewController: UITableViewController {

    var sections = [AnyObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        /// 我的 我的界面 cell 数据
        NetworkTool.loadMineCellData { (sectionArray) in
            self.sections = sectionArray
            self.tableView.reloadData()
        }
    }

    // 头部视图
    fileprivate lazy var noLoginHeaderView: NoLoginHeaderView = {
        let noLoginHeaderView = NoLoginHeaderView.headerView()
        noLoginHeaderView.delegate = self
        return noLoginHeaderView
    }()
}

// MARK: - NoLoginHeaderViewDelegate 未登录界面代理
extension MineViewController: NoLoginHeaderViewDelegate {
    /// 更多登录方式按钮点击
    func noLoginHeaderViewMoreLoginButotnClicked() {
        let storyboard = UIStoryboard(name: "MoreLoginViewController", bundle: nil)
        let moreLoginVC = storyboard.instantiateViewController(withIdentifier: "MoreLoginViewController") as! MoreLoginViewController
        moreLoginVC.modalSize = (width: .full, height: .custom(size: Float(screenHeight - 40)))
        present(moreLoginVC, animated: true, completion: nil)
    }
}

extension MineViewController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.tableHeaderView = noLoginHeaderView
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor(r: 220, g: 220, b: 220)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MineViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 36
            case 1, 2:
                return 36
            default:
                return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "mineCell")
        cell.accessoryType = .disclosureIndicator
        let rows = sections[indexPath.section]
        let mineCellModel = rows[indexPath.row] as! MineCellModel
        cell.textLabel?.text = mineCellModel.text!
        cell.textLabel?.text = mineCellModel.grey_text!
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: - UIScrollViewDelagate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if offsetY < 0 {
            let totalOffset = kMineHeaderViewHieght + abs(offsetY)
            let f = totalOffset / kMineHeaderViewHieght
            noLoginHeaderView.bgImageView.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
