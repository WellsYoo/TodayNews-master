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

class NewsDetailImageComment {
    
    var id: Int?
    
    var reply_count: Int?
    // 点赞数量
    var digg_count: Int?
    
    var reply_list = [AnyObject]()
    
    var create_time: TimeInterval?
    var createTime: String? {
        get {
            //创建时间
            var createDate: Date?
            if let createTime = create_time {
                createDate = Date(timeIntervalSince1970: createTime)
            }
            let fmt = DateFormatter()
            fmt.locale = Locale(identifier: "zh_CN")
            fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            //当前时间
            let now = Date()
            //日历
            let calender = Calendar.current
            let comps: DateComponents = calender.dateComponents([.year, .month, .day, .hour, .minute, .second], from: createDate!, to: now)
            guard (createDate?.isThisYear())! else { // 今年
                fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
                return fmt.string(from: createDate!)
            }
            if (createDate?.isYesterday())! { // 昨天
                fmt.dateFormat = "昨天 HH:mm";
                return fmt.string(from: createDate!)
            } else if (createDate?.isToday())! {
                if comps.hour! >= 1 {
                    return String(format: "%.d小时前", comps.hour!)
                } else if comps.minute! >= 1 {
                    return String(format: "%d分钟前", comps.minute!)
                } else {
                    return "刚刚";
                }
            } else {
                fmt.dateFormat = "MM-dd HH:mm";
                return fmt.string(from: createDate!)
            }
        }
    }
    
    var user_profile_image_url: String?
    var user_name: String?
    var user_id: Int?
    
    var text: String?
    var reply_to_comment: ReplyToComment?
    var commentText: NSString? {
        get {
            //
            if let replaytoComment = reply_to_comment {
                let totalText = (text! as String) + "//@\(replaytoComment.user_name!)：" + (replaytoComment.text! as String)
                return totalText as NSString
            } else {
                return text! as NSString
            }
        }
    }
    var textH: CGFloat? {
        get {
            return commentText?.getTextHeight(width: screenWidth - 15 - 57)
        }
    }
    var is_following: Bool?
    
    var cellHeight: CGFloat? {
        get {
            /*
            let nameButtonTop: CGFloat = 12
            let nameButtonHeight: CGFloat = 16
            let nameButtonBotom: CGFloat = 10
            
            let replayButtonTop: CGFloat = 10
            let replayButtonHeight: CGFloat = 20
            let replayButtonBottom: CGFloat = 10
            */
            // 上面这些相加
            return textH! + 78
        }
    }
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        reply_count = dict["reply_count"] as? Int
        digg_count = dict["digg_count"] as? Int
        create_time = dict["create_time"] as? TimeInterval
        user_profile_image_url = dict["user_profile_image_url"] as? String
        user_name = dict["user_name"] as? String
        user_id = dict["user_id"] as? Int
        if let replyToComment = dict["reply_to_comment"] {
            reply_to_comment = ReplyToComment(dict: replyToComment as! [String: AnyObject])
        }
        text = dict["text"] as? String
        is_following = dict["is_following"] as? Bool
    }
    /*
     "id": 1574780216208398,
     "text": "还负责解决生理需求，战队队员两天一换！技术好的留下",
     "reply_count": 0,
     "reply_list": [],
     "digg_count": 139,
     "bury_count": 0,
     "create_time": 1501827446,
     "score": 0.232821986079216,
     "user_id": 5498789331,
     "user_name": "憨比朝阳",
     "user_profile_image_url": "http://p1.pstatp.com/thumb/3795/3033762272",
     "user_verified": false,
     "is_following": 0,
     "is_followed": 0,
     "is_blocking": 0,
     "is_blocked": 0,
     "is_pgc_author": 0,
     "author_badge": [],
     "verified_reason": "",
     "user_bury": 0,
     "user_digg": 0,
     "user_relation": 0,
     "user_auth_info": "",
     "media_info": {
     "name": "",
     "avatar_url": ""
     }
     
     如果有回复就会出现下面的字段
     "reply_to_comment": {
         "id": 1574777650675725,
         "text": "跟ruru太后比不是一个档次，太后都是身价几亿的人了",
         "user_id": 51355537640,
         "user_name": "游戏王者玩家",
         "user_profile_image_url": "http://p3.pstatp.com/thumb/2c5d001d538c1c782a05",
         "user_verified": false,
         "is_pgc_author": 0,
         "is_following": 0,
         "is_followed": 0,
         "user_relation": 0
     }
     */
}

class ReplyToComment {
    var id: Int?
    
    var text: NSString?
    
    var user_profile_image_url: String?
    var user_name: String?
    var user_id: Int?
    
    var reply_to_comment: ReplyToComment?
    
    var is_following: Bool?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        text = dict["text"] as? NSString
        is_following = dict["is_following"] as? Bool
        user_profile_image_url = dict["user_profile_image_url"] as? String
        user_name = dict["user_name"] as? String
        user_id = dict["user_id"] as? Int
        
    }
}



