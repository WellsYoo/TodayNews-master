//
//  NetworkTool.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/16.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkTool {
    
    
    
    /// -------------------------- 首 页 -------------------------
    /// 获取首页顶部标题内容
    class func loadHomeTitlesData(finished:@escaping (_ topTitles: [HomeTopTitle])->()) {
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id,
                      "aid": 13,
                      "iid": IID] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let dataDict = json["data"].dictionary
                if let data = dataDict!["data"]!.arrayObject {
                    var topics = [HomeTopTitle]()
                    for dict in data {
                        let title = HomeTopTitle(dict: dict as! [String: AnyObject])
                        topics.append(title)
                    }
                    finished(topics)
                }
            }
        }
    
    }
    
    /// 获取首页不同分类的新闻内容(和视频内容使用一个接口)
    class func loadHomeCategoryNewsFeed(category: String, tableView: UITableView, finished:@escaping (_ nowTime: TimeInterval,_ newsTopics: [NewsTopic])->()) {
        let url = BASE_URL + "api/news/feed/v39/?"
        let params = ["device_id": device_id,
                      "category": category,
                      "iid": IID]
        let nowTime = NSDate().timeIntervalSince1970
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let datas = json["data"].array
                var topics = [NewsTopic]()
                for data in datas! {
                    let content = data["content"].stringValue
                    let contentData: NSData = content.data(using: String.Encoding.utf8)! as NSData
                    do {
                        let dict = try JSONSerialization.jsonObject(with: contentData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                        print(dict)
                        let topic = NewsTopic(dict: dict as! [String : AnyObject])
                        topics.append(topic)
                    } catch {
                        
                    }
                    
                }
                finished(nowTime, topics)
            }
        }
    }
    
    /// -------------------------- 视 频 --------------------------
    
    /// 获取视频顶部标题内容
    class func loadVideoTitlesData(finished:@escaping (_ videoTitles: [VideoTopTitle])->()) {
        let url = BASE_URL + "video_api/get_category/v1/?"
        let params = ["device_id": device_id,
                      "version_code": versionCode,
                      "app_name": "news_article",
                      "channel": "App%20Store",
                      "device_platform": "iphone",
                      "vid": "9E7F056D-4902-4CA5-B77F-5EFE0B0D112C",
                      "aid": "13",
                      "ab_version": "95367,106283,105703,101786,106209,101533,103923,105769,106281,106205,106784,106673,97143,31651,104832,101558,94045,105756,92438,104236,105759,105610,106702,105788,106299,103570,105857,104711,98043,105475,103630,103435",
                      "ab_feature": "z1",
                      "openudid": "fad94bc66e60ce903ed1a20efec5f94b82c42cee",
                      "live_sdk_version": "1.6.5",
                      "idfv": "9E7F056D-4902-4CA5-B77F-5EFE0B0D112C",
                      "ssmix": "a",
                      "iid": IID,
                      "os_version": systemVersion]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                if let data = json["data"].arrayObject {
                    var titles = [VideoTopTitle]()
                    for dict in data {
                        let title = VideoTopTitle(dict: dict as! [String: AnyObject])
                        titles.append(title)
                    }
                    finished(titles)
                }
            }
        }
    }
    
    /// --------------------------  微  头  条  --------------------------
    
    /// 获取微头条数据
    class func loadWeiTouTiaoData() {
        /**
         version_code=6.1.6&app_name=news_article&vid=9E7F056D-4902-4CA5-B77F-5EFE0B0D112C&device_id=6096495334&idfv=9E7F056D-4902-4CA5-B77F-5EFE0B0D112C&ac=WIFI&os_version=9.3.2&iid=5034850950&idfa=12D3CE1F-D56F-4DFD-9896-A4379014B6BE&category=weitoutiao&city=%E6%9D%AD%E5%B7%9E&concern_id=6368255615201970690&count=20&cp=539d461c44069q1&last_refresh_sub_entrance_interval=4805&min_behot_time=1497448512
         */
        let url = BASE_URL + " api/news/feed/v54/?"
        let params = ["version_code": versionCode,
                      "iid": IID,
                      "category": "weitoutiao",
                      "count": 20,
                      "min_behot_time": "",
//                      "app_name": app_name,
//                      "idfv": idfv,
//                      "idfa": idfa,
//                      "ac": "WIFI",
//                      "city": "",
//                      "concern_id": ""
                        ] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                if let message = json["message"].string {
                    if message == "success" {
                        if let data = json["data"].dictionary {
                            print(data)
                        }
                    }
                }
            }
        }
        
    }
    
    
    /// 我的
    /// 我的界面 cell 数据
    class func loadMineCellData() {
        let url = BASE_URL + "user/tab/tabs/?"
        let params = ["version_code": versionCode,
                      "iid": IID]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                if let message = json["message"].string {
                    if message == "success" {
                        if let data = json["data"].dictionary {
                            if let sections = data["sections"]?.arrayObject {
                                print(sections)
//                                var sectionArray = [AnyObject]()
//                                var rows = [MineCell]()
//                                for section in sections {
//                                    for row in section {
//                                        let mineCell = MineCell(dict: row)
//                                        rows.append(mineCell)
//                                    }
//                                    sectionArray.append(rows as AnyObject)
//                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
