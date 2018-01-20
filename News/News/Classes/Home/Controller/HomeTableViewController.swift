//
//  HomeTableViewController.swift
//  News
//
//  Created by 杨蒙 on 2018/1/17.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    /// 标题
    var newsTitle = HomeNewsTitle()
    /// 视频数据
    var news = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 100))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "首页，微头条，搜索界面暂未实现\n 可点击其他界面"
        label.font = UIFont.systemFont(ofSize: 20)
        tableView.tableHeaderView = label
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - Table view data source
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
}
