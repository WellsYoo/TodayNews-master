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
    
    
    
    /// -------------------------- 首 页 home -------------------------
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
    class func loadHomeCategoryNewsFeed(category: String, finished:@escaping (_ nowTime: TimeInterval,_ newsTopics: [WeiTouTiao])->()) {
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
                var topics = [WeiTouTiao]()
                for data in datas! {
                    let content = data["content"].stringValue
                    let contentData: NSData = content.data(using: String.Encoding.utf8)! as NSData
                    do {
                        let dict = try JSONSerialization.jsonObject(with: contentData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                        print(dict)
                        let topic = WeiTouTiao(dict: dict as! [String : AnyObject])
                        topics.append(topic)
                    } catch {
                        
                    }
                }
                finished(nowTime, topics)
            }
        }
    }
    
    /// -------------------------- 视 频 video --------------------------
    
    /// 获取视频顶部标题内容
    class func loadVideoTitlesData(completionHandler:@escaping (_ videoTitles: [TopTitle], _ videoTopicVCs: [VideoTopicController])->()) {
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
                    var titles = [TopTitle]()
                    var videoTopicVCs = [VideoTopicController]()
                    for dict in data {
                        let title = TopTitle(dict: dict as! [String: AnyObject])
                        let videoTopicVC = VideoTopicController()
                        videoTopicVCs.append(videoTopicVC)
                        titles.append(title)
                    }
                    completionHandler(titles, videoTopicVCs)
                }
            }
        }
    }
    
    // --------------------------  微  头  条  --------------------------
    
    /// 获取微头条数据
    class func loadWeiTouTiaoData(completionHandler: @escaping (_ weitoutiaos: [WeiTouTiao]) -> ()) {
        let url = BASE_URL + "api/news/feed/v54/?"
        let params = ["version_code": versionCode,
                      "iid": IID,
                      "app_name": app_name,
                      "category": "weitoutiao",
                      "count": 20,
//                      "min_behot_time": currentTimeInterval,
                      "device_id": device_id,
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
                guard let message = json["message"].string else {
                    return
                }
                guard message == "success" else {
                    return
                }
                guard let dataJSONs = json["data"].array else {
                    return
                }
                var weitoutiaos = [WeiTouTiao]()
                for dataJSON in dataJSONs {
                    if let content = dataJSON["content"].string {
                        
                        let data = content.data(using: String.Encoding.utf8)! as Data
                        let dict = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                        print(dict)
                        print("-------------------------")
                        let weitoutiao = WeiTouTiao(dict: dict as! [String : AnyObject])
                        weitoutiaos.append(weitoutiao)
                    }
                }
                completionHandler(weitoutiaos)
            }
        }
    }
    
    /// 点击了关注按钮
    class func loadFollowInfo(user_id: Int, completionHandler: @escaping (_ isFllowing: Bool)->()) {
        let url = BASE_URL + "2/relation/follow/v2/?"
        let params = ["version_code": versionCode,
                      "app_name": app_name,
                      "iid": IID,
                      "user_id": user_id,
                      "device_id": device_id] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard let message = json["message"].string else {
                    return
                }
                guard message == "success" else {
                    return
                }
                guard let data = json["data"].dictionary else {
                    return
                }
                guard data["description"]?.string == "关注成功" else {
                    return
                }
                if let user = data["user"]?.dictionaryObject {
                    let user_info = WTTUser(dict: user as [String : AnyObject])
                    completionHandler(user_info.is_following!)
                }
            }
        }
        
    }
    
    /// 点击了取消关注按钮
    class func loadUnfollowInfo(user_id: Int, completionHandler: @escaping (_ isFllowing: Bool)->()) {
        let url = BASE_URL + "/2/relation/unfollow/?"
        let params = ["version_code": versionCode,
                      "app_name": app_name,
                      "iid": IID,
                      "user_id": user_id,
                      "device_id": device_id] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard let message = json["message"].string else {
                    return
                }
                guard message == "success" else {
                    return
                }
                guard let data = json["data"].dictionary else {
                    return
                }
                if let user = data["user"]?.dictionaryObject {
                    let user_info = WTTUser(dict: user as [String : AnyObject])
                    completionHandler(user_info.is_following!)
                }
            }
        }
        
    }
    
    // --------------------------------- 我的 mine  ---------------------------------
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
