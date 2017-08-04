//
//  NewsDetail.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/3.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class NewsDetail {
    
    var title: String?
    
    var body: String?
    
    var images = [NewsDetailImage]()
    
    init(dict: [String: AnyObject]) {
        
    }
    
}

class NewsDetailImage {
    
    var url: String?
    
    var width: Int?
    
    var height: Int?
    
    var rate: CGFloat = 1
    
    init(dict: [String: AnyObject]) {
        url = dict["url"] as? String
        height = dict["height"] as? Int
        width = dict["width"] as? Int
        rate = CGFloat(width!) / CGFloat(height!)
    }
}

class NewsDetailMediaInfo {
    
    var name: String?
    
    var avatarUrl: String?
    
    var openUrl: String?
    
    var id: Int?
    
    var user_id: Int?
    
    var like: Bool?
    
    init(dict: [String: AnyObject]) {
        name = dict["name"] as? String
        avatarUrl = dict["avatarUrl"] as? String
        openUrl = dict["openUrl"] as? String
        id = dict["id"] as? Int
        user_id = dict["user_id"] as? Int
        like = dict["like"] as? Bool
        
    }
}

class NewsDetailUserInfo {
    var name: String?
    
    var avatarUrl: String?
    
    var id: Int?
    
    var isPgc: Bool?
    
    var isOwner: Bool?
    
    init(dict: [String: AnyObject]) {
        name = dict["name"] as? String
        avatarUrl = dict["avatarUrl"] as? String
        id = dict["id"] as? Int
        isPgc = dict["isPgc"] as? Bool
        isOwner = dict["isOwner"] as? Bool
    }
}

class NewsDetailCommentInfo {
    
    var group_id: Int?
    
    var item_id: Int?
    
    var comments_count: Int?
    
    var ban_comment: Int?
    
    init(dict: [String: AnyObject]) {
        group_id = dict["group_id"] as? Int
        item_id = dict["item_id"] as? Int
        comments_count = dict["comments_count"] as? Int
        ban_comment = dict["ban_comment"] as? Int
    }
}



