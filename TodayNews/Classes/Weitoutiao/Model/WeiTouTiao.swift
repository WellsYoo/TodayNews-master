//
//  WeiTouTiao.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/15.
//  Copyright © 2017年 hrscy. All rights reserved.
//


import UIKit

class WeiTouTiao {
    /// 过滤内容
    var filter_words = [WTTFilterWord]()
    // 内容
    var content: String?
    /// 点赞数量
    var like_count: Int?
    
    var digg_count: Int?
    
    var bury_count: Int?
    /// 阅读量
    var read_count: Int?
    /// 评论数量
    var comment_count: Int?
    
    var behot_time: Int?
    var create_time: Int?
    
    var cursor: Int?
    
    var default_text_line: Int?
    
    var cell_flag: Int?
    
    var cell_layout_style: Int?
    
    var cell_type: Int?
    
    var cell_ui_type: String?
    
    var follow: Int?
    
    var inner_ui_flag: Int?
    
    var is_stick: Int?
    
    var large_image_list = [WTTLargeImageList]()
    var ugc_cut_image_list = [WTTUgcCutImageList]()
    var thumb_image_list = [WTTThumbImageList]()
    
    var ui_type: Int?
    
    var user: WTTUser?
    var user_info: WTTUser?
    
    var user_digg: Int?
    
    var user_repin: Int?
    
    var user_verified: Bool?
    
    var verified_content: String?
    
    var log_pb: LogPB?
    
    var max_text_line: Int?
    
    var rid: String?
    
    var schema: String?
    
    var share_url: String?
    
    var stick_style: Int?
    
    var comments: [AnyObject]?
    
    var title: String?
    
    init(dict: [String: AnyObject]) {
        /// 遍历举报的内容
        if let filterWords = dict["filter_words"] as? [AnyObject] {
            for item in filterWords {
                let filterWord = WTTFilterWord(dict: item as! [String: AnyObject])
                filter_words.append(filterWord)
            }
        }
        content = dict["content"] as? String
        like_count = dict["like_count"] as? Int
        digg_count = dict["digg_count"] as? Int
        bury_count = dict["bury_count"] as? Int
        read_count = dict["read_count"] as? Int
        comment_count = dict["comment_count"] as? Int
        behot_time = dict["behot_time"] as? Int
        create_time = dict["create_time"] as? Int
        cursor = dict["cursor"] as? Int
        default_text_line = dict["default_text_line"] as? Int
        cell_flag = dict["cell_flag"] as? Int
        cell_layout_style = dict["cell_layout_style"] as? Int
        cell_ui_type = dict["cell_ui_type"] as? String
        cell_type = dict["cell_type"] as? Int
        follow = dict["follow"] as? Int
        inner_ui_flag = dict["inner_ui_flag"] as? Int
        if let userTemp = dict["user"] {
            user = WTTUser(dict: userTemp as! [String : AnyObject] )
        } else if let userInfoTemp = dict["user_info"] {
            user_info = WTTUser(dict: userInfoTemp as! [String : AnyObject] )
        }
        user_digg = dict["user_digg"] as? Int
        user_verified = dict["user_verified"] as? Bool
        user_repin = dict["user_repin"] as? Int
        verified_content = dict["verified_content"] as? String
        if let logPb = dict["log_pb"] {
            log_pb = LogPB(dict: logPb as! [String : AnyObject])
        }
        max_text_line = dict["max_text_line"] as? Int
        rid = dict["rid"] as? String
        schema = dict["schema"] as? String
        share_url = dict["share_url"] as? String
        stick_style = dict["user_id"] as? Int
        user_verified = dict["user_verified"] as? Bool
        title = dict["title"] as? String
    }
}

class WTTUser {
    
    var avatar_url: String?
    
    var desc: String?
    var description: String?
    
    var is_following: Bool?
    var follower_count: Int?
    var follow: Int?
    
    var is_friend: Bool?
    
    var schema: String?
    
    var screen_name: String?
    var name: String?
    
    var userAuthInfo: WTTUserAuthInfo?
    
    var user_id: String?
    
    var user_verified: Bool?
    
    init(dict: [String: AnyObject]) {
        user_id = dict["user_id"] as? String
        user_verified = dict["user_verified"] as? Bool
        is_following = dict["is_following"] as? Bool
        is_friend = dict["is_friend"] as? Bool
        follower_count = dict["follower_count"] as? Int
        follow = dict["follow"] as? Int
        avatar_url = dict["avatar_url"] as? String
        desc = dict["desc"] as? String
        description = dict["description"] as? String
        schema = dict["schema"] as? String
        screen_name = dict["screen_name"] as? String
        name = dict["name"] as? String
        
        if let user_auth_info = dict["user_auth_info"] {
            if user_auth_info as! String == "" {
                return
            }
            let data = user_auth_info.data(using: String.Encoding.utf8.rawValue)! as Data
            let dict = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            userAuthInfo = WTTUserAuthInfo(dict: dict as! [String : AnyObject])
        }
    }
    
}

class WTTUserAuthInfo {
    
    var auth_type: Int?
    var auth_info: String?
    
    init(dict: [String: AnyObject]) {
        auth_type = dict["auth_type"] as? Int
        auth_info = dict["auth_info"] as? String
    }
}

class WTTUgcCutImageList {
    
    var height: CGFloat?
    var width: CGFloat?
    
    var type: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [WTTURLList]?
    
    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        type = dict["type"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [WTTURLList]
    }
}

class WTTThumbImageList {
    
    var height: CGFloat?
    var width: CGFloat?
    
    var type: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [WTTURLList]?
    
    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        type = dict["type"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [WTTURLList]
    }
}

class LogPB {
    
    var impr_id: Int?
    
    init(dict: [String: AnyObject]) {
        impr_id = dict["impr_id"] as? Int
    }
}

class WTTLargeImageList {
    
    var height: CGFloat?
    var width: CGFloat?
    
    var type: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [WTTURLList]?

    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        type = dict["type"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [WTTURLList]
    }
}

class WTTURLList {
    
    var url: String?
    
    init(dict: [String: AnyObject]) {
        url = dict["url"]  as? String
    }
}

class WTTFilterWord {
    
    var id: String?
    
    var is_selected: Bool?
    
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"]  as? String
        is_selected = dict["is_selected"] as? Bool
        name = dict["name"] as? String
    }
}
