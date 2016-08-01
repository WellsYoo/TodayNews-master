//
//  YMNetworkTool.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import MJRefresh

class YMNetworkTool: NSObject {
    /// 单例
    static let shareNetworkTool = YMNetworkTool()
    
    /// 关心
    /// 获取新的 关心数据列表
    func loadNewConcernList(tableView: UITableView, finished:(concerns: [YMConcern]) -> ()) {
        let url = "http://lf.snssdk.com/concern/v1/concern/list/"
        let params = ["iid": 5034850950,
                      "count": 20,
                      "offset": 0,
                      "type": "manage"]
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            Alamofire
                .request(.POST, url, parameters: params)
                .responseJSON { (response) in
                    tableView.mj_header.endRefreshing()
                    guard response.result.isSuccess else {
                        SVProgressHUD.showErrorWithStatus("加载失败...")
                        return
                    }
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let concern_list = json["concern_list"].arrayObject {
                            var concerns = [YMConcern]()
                            for dict in concern_list {
                                let concern = YMConcern(dict: dict as! [String: AnyObject])
                                concerns.append(concern)
                            }
                            finished(concerns: concerns)
                        }
                    }
            }
        })
        tableView.mj_header.automaticallyChangeAlpha = true //根据拖拽比例自动切换透明度
        tableView.mj_header.beginRefreshing()
    }
    
    /// 获取更多 关心数据列表
    func loadMoreConcernList(tableView: UITableView, outOffset: Int, finished:(inOffset: Int, concerns: [YMConcern]) -> ()) {
        let url = "http://lf.snssdk.com/concern/v1/concern/list/"
        let params = ["iid": 5034850950,
                      "count": 20,
                      "offset": outOffset,
                      "type": "recommend"]
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { 
            Alamofire
                .request(.POST, url, parameters: params as? [String : AnyObject])
                .responseJSON { (response) in
                    tableView.mj_footer.endRefreshing()
                    guard response.result.isSuccess else {
                        SVProgressHUD.showErrorWithStatus("加载失败...")
                        return
                    }
                    if let value = response.result.value {
                        let json = JSON(value)
                        let inOffset = json["offset"].int!
                        print(inOffset)
                        if let concern_list = json["concern_list"].arrayObject {
                            var concerns = [YMConcern]()
                            for dict in concern_list {
                                let concern = YMConcern(dict: dict as! [String: AnyObject])
                                concerns.append(concern)
                            }
                            finished(inOffset: inOffset, concerns: concerns)
                        }
                    }
            }
        })
    }
    
}
