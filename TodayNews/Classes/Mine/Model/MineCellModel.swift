//
//  MineCell.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class MineCellModel {
    
    var grey_text: String?
//    var icons: [String: AnyObject]?
    var text: String?
    var url: String?
    var key: String?
    var tip_new: Int?
    
    init(dict: [String: AnyObject]) {
        grey_text = dict["grey_text"] as? String
        text = dict["text"] as? String
        url = dict["url"] as? String
        key = dict["key"] as? String
        tip_new = dict["tip_new"] as? Int
        
    }
    
}

class MyConcern {
    
    var name: String?
    var url: String?
    var total_count: Int?
    var description: String?
    var time: String?
    var type: String?
    var icon: String?
    var userid: Int?
    
    init(dict: [String: AnyObject]) {
        name = dict["name"] as? String
        url = dict["url"] as? String
        total_count = dict["total_count"] as? Int
        description = dict["description"] as? String
        time = dict["time"] as? String
        type = dict["type"] as? String
        icon = dict["icon"] as? String
        userid = dict["userid"] as? Int
    }
}

class FollowDetail {
    
    var bottom_tab: [AnyObject]?
    var common_friends: [AnyObject]?
    var star_chart: [String: AnyObject]?
    
    var is_followed: Bool?
    var article_limit_enable: Int?
    var is_following: Bool?
    var pgc_like_count: Int?
    var user_verified: Bool?
    var current_user_id: Int?
    var verified_agency: String?
    var top_tab = [TopTab]()
    var is_blocking: Bool?
    var user_id: Int?
    var area: String?
    var share_url: String?
    var show_private_letter: Int?
    var followers_count: Int?
    var followings_count: Int?
    var followersCount: String? {
        get {
            guard let count = followers_count else {
                return "0"
            }
            guard count >= 10000 else {
                return String(describing: count)
            }
            return String(format: "%.1f万", Float(count) / 10000.0)
        }
    }
    
    var followingsCount: String? {
        get {
            guard let count = followings_count else {
                return "0"
            }
            guard count >= 10000 else {
                return String(describing: count)
            }
            return String(format: "%.1f万", Float(count) / 10000.0)
        }
    }
    
    var status: Int?
    var media_id: Int?
    var description: NSString?
    var descriptionH: CGFloat? {
        get {
            return description?.getTextHeight(width: screenWidth - kMargin - 55)
        }
    }
    
    var apply_auth_url: String?
    var bg_img_url: String?
    var verified_content: String?
    var screen_name: String?
    var visit_count_recent: Int?
    var is_blocked: Bool?
    var user_auth_info: String?
    var name: String?
    var big_avatar_url: String?
    var gender: Int?
    var industry: String?
    var ugc_publish_media_id: Int?
    var avatar_url: String?
    
    init(dict: [String: AnyObject]) {
        article_limit_enable = dict["article_limit_enable"] as? Int
        is_followed = dict["is_followed"] as? Bool
        pgc_like_count = dict["pgc_like_count"] as? Int
        user_verified = dict["user_verified"] as? Bool
        current_user_id = dict["current_user_id"] as? Int
        is_following = dict["is_following"] as? Bool
        verified_agency = dict["verified_agency"] as? String
        for item in dict["top_tab"] as! [AnyObject] {
            let topTab = TopTab(dict: item as! [String : AnyObject])
            top_tab.append(topTab)
        }
        is_blocking = dict["is_blocking"] as? Bool
        user_id = dict["user_id"] as? Int
        area = dict["area"] as? String
        share_url = dict["share_url"] as? String
        show_private_letter = dict["show_private_letter"] as? Int
        followers_count = dict["followers_count"] as? Int
        status = dict["status"] as? Int
        media_id = dict["media_id"] as? Int
        description = dict["description"] as? NSString
        apply_auth_url = dict["apply_auth_url"] as? String
        bg_img_url = dict["bg_img_url"] as? String
        verified_content = dict["verified_content"] as? String
        show_private_letter = dict["show_private_letter"] as? Int
        screen_name = dict["screen_name"] as? String
        visit_count_recent = dict["visit_count_recent"] as? Int
        is_blocked = dict["is_blocked"] as? Bool
        user_auth_info = dict["user_auth_info"] as? String
        name = dict["name"] as? String
        bg_img_url = dict["bg_img_url"] as? String
        big_avatar_url = dict["big_avatar_url"] as? String
        gender = dict["gender"] as? Int
        industry = dict["industry"] as? String
        ugc_publish_media_id = dict["ugc_publish_media_id"] as? Int
        avatar_url = dict["avatar_url"] as? String
        followings_count = dict["followings_count"] as? Int
    }
}

class TopTab {
    
    var url: String?
    var is_default: Bool?
    var show_name: String?
    var type: String?
    
    init(dict: [String: AnyObject]) {
        url = dict["url"] as? String
        is_default = dict["is_default"] as? Bool
        show_name = dict["show_name"] as? String
        type = dict["type"] as? String
    }
}
