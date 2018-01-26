//
//  HomeRecommendController.swift
//  News
//
//  Created by 杨蒙 on 2018/1/26.
//  Copyright © 2018年 hrscy. All rights reserved.
//
import UIKit

class HomeRecommendController: HomeTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 注册推荐的 cell
        tableView.ym_registerCell(cell: HomeUserCell.self)
        tableView.ym_registerCell(cell: TheyAlsoUseCell.self)
        tableView.ym_registerCell(cell: HomeCell.self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - Table view data source
extension HomeRecommendController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let aNews = news[indexPath.row]
        switch aNews.cell_type {
        case .user:
            return aNews.contentH
        case .relatedConcern:
            return 290
        case .none:
            return aNews.cellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aNews = news[indexPath.row]
        switch aNews.cell_type {
        case .user:             // 用户
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeUserCell
            cell.aNews = aNews
            return cell
        case .relatedConcern:   // 相关关注
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as TheyAlsoUseCell
            cell.theyUse = aNews.raw_data
            return cell
        case .none:
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as HomeCell
            cell.aNews = aNews
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aNews = news[indexPath.row]
        if (aNews.source == "悟空问答") { // 悟空问答
            let wendaVC = WendaViewController()
            wendaVC.qid = aNews.item_id
            wendaVC.enterForm = .clickHeadline
            navigationController?.pushViewController(wendaVC, animated: true)
        }
    }
}
