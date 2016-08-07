//
//  YMNewsTopic.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/5.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  每条新闻的内容
//

import UIKit

class YMNewsTopic: NSObject {
    // 文字的高度
    var titleH: CGFloat = 0
    var imageW: CGFloat = 0
    var imageH: CGFloat = 0
    
    var abstract: String?
    
    var keywords: String?
    
    var title: NSString?
    
    var label: String?
    var label_style: Int?
    
    var article_alt_url: String?
    var article_url: String?
    var display_url: String?
    var share_url: String?
    var url: String?
    
    var item_id: Int?
    
    var tag_id: Int?
    var tag: String?
    
    var read_count: Int?
    var comment_count: Int?
    var repin_count: Int?
    var digg_count: Int?
    
    var publish_time: Int?
    
    var source: String?
    var source_avatar: String?
    var stick_label: String?
    
    var gallary_image_count: Int?
    var group_id: Int?
    
    var has_image: Bool?
    var has_m3u8_video: Bool?
    var has_mp4_video: Bool?
    var has_video: Bool?
    
    var video_detail_info: [YMVideoDetailInfo]?
    
    var video_style: Int?
    var video_duration: Int?
    var video_id: Int?
    
    // 点击 『x』 按钮，弹出框内容
    var filter_words: [YMFilterWord]?
    
    var image_list: [YMImageList]?
    var middle_image: YMMiddleImage?
    var large_image_list: [YMLargeImageList]?
    
    var behot_time: Int?
    
    var cell_flag: Int?
    var bury_count: Int?
    
    var article_type: Int?
    
    var cursor: Int?
    
    var media_info: YMMediaInfo?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        cursor = dict["cursor"] as? Int
        
        article_type = dict["article_type"] as? Int
        
        bury_count = dict["bury_count"] as? Int
        cell_flag = dict["cell_flag"] as? Int
        behot_time = dict["behot_time"] as? Int
        
        has_video = dict["has_video"] as? Bool
        has_mp4_video = dict["has_mp4_video"] as? Bool
        has_m3u8_video = dict["has_m3u8_video"] as? Bool
        has_image = dict["has_image"] as? Bool
        
        video_detail_info = dict["video_detail_info"] as? [YMVideoDetailInfo]
        video_duration = dict["video_duration"] as? Int
        video_id = dict["video_id"] as? Int
        video_style = dict["video_style"] as? Int
        
        group_id = dict["group_id"] as? Int
        gallary_image_count = dict["gallary_image_count"] as? Int
        
        tag = dict["tag"] as? String
        tag_id = dict["tag_id"] as? Int
        item_id = dict["item_id"] as? Int
        
        read_count = dict["read_count"] as? Int
        comment_count = dict["comment_count"] as? Int
        repin_count = dict["repin_count"] as? Int
        digg_count = dict["digg_count"] as? Int
        
        publish_time = dict["publish_time"] as? Int
        
        keywords = dict["keywords"] as? String
        abstract = dict["abstract"] as? String

        source = dict["source"] as? String
        source_avatar = dict["source_avatar"] as? String
        stick_label = dict["stick_label"] as? String
        
        label = dict["label"] as? String
        label_style = dict["label_style"] as? Int
        
        /// 遍历举报的内容
        let filterWords = dict["filter_words"] as? [AnyObject]
        if filterWords?.count != 0 {
            for item in filterWords! {
                let filterWord = YMFilterWord(dict: item as! [String: AnyObject])
                filter_words?.append(filterWord)
            }
        }
        
        let imageLists = dict["image_list"] as? [AnyObject]
        middle_image = YMMiddleImage(dict: dict["middle_image"] as! [String: AnyObject])
        let largeImageLists = dict["large_image_list"] as? [AnyObject]
        
        let mediaDict = dict["media_info"]
        if mediaDict != nil {
            media_info = YMMediaInfo(dict: mediaDict as! [String: AnyObject])
        }
        
        title = dict["title"] as? NSString
        
        var size = CGSizeZero
        // 2.如果 middle_image 不为空，则在 cell 显示一张图片 70 × 108，文字在左边，图片在右边
        if middle_image != nil {
            // 当 middle_image 不为 0 时，image_list 可能为 0 ，可能不为 0
            // 1.如果 image_list 不为空，则显示 3 张图片 ((SCREENW -30 -12) / 3)×70，文字在上边
            // 文字的宽度 SCREENW-30
            if imageLists?.count != 0 {
                imageW = (SCREENW - CGFloat(42)) / 3
                // 文字的宽度 SCREENW-30
                size = CGSizeMake(SCREENW - 30, CGFloat(MAXFLOAT))
                // 循环遍历 image_list
                for item in imageLists! {
                    let imageList = YMImageList(dict: item as! [String: AnyObject])
                    image_list?.append(imageList)
                }
            } else {
                // 文字在左边，图片在右边
                imageW = 108
                // 文字宽度 SCREENW - 108 - 30 - 20
                size = CGSizeMake(SCREENW - 158, CGFloat(MAXFLOAT))
            }
            imageH = 70
        } else { // 大图、视频图片或广告
            // 3.如果 large_image_list 不为空，则显示一张大图 (SCREENW -30)×170，文字在上边
            imageH = 170
            imageW = SCREENW - CGFloat(30)
            size = CGSizeMake(SCREENW - 30, CGFloat(MAXFLOAT))
            if largeImageLists?.count != 0 {
                for item in largeImageLists! {
                    let largeImage = YMLargeImageList(dict: item as! [String: AnyObject])
                    large_image_list?.append(largeImage)
                }
            }
        }
        titleH = abstract!.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size.height
        print("titleH=\(titleH)--------------------------")
    }
    
}

class YMMediaInfo: NSObject {
    
    var avatar_url: String?
    var name: String?
    var media_id: Int?
    var user_verified: Int?
    
    init(dict: [String: AnyObject]) {
        super.init()
        avatar_url = dict["avatar_url"] as? String
        name = dict["name"] as? String
        user_verified = dict["user_verified"] as? Int
        media_id = dict["media_id"] as? Int
    }
    
    
}

class YMFilterWord: NSObject {
    
    var id: String?
    
    var is_selected: Bool?
    
    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        id = dict["id"] as? String
        name = dict["name"] as? String
        is_selected = dict["is_selected"] as? Bool
    }
}

class YMImageList: NSObject {
    
    var hight: Int?
    var width: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [[String: AnyObject]]?
    
    init(dict: [String: AnyObject]) {
        super.init()
        hight = dict["hight"] as? Int
        width = dict["width"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [[String: AnyObject]] ?? [[:]]
    }
}

class YMMiddleImage: NSObject {
    
    var hight: Int?
    var width: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [[String: AnyObject]]?
    
    init(dict: [String: AnyObject]) {
        super.init()
        hight = dict["hight"] as? Int
        width = dict["width"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [[String: AnyObject]] ?? [[:]]
    }
}

class YMLargeImageList: NSObject {
    
    var hight: Int?
    var width: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [[String: AnyObject]]?
    
    init(dict: [String: AnyObject]) {
        super.init()
        hight = dict["hight"] as? Int
        width = dict["width"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [[String: AnyObject]] ?? [[:]]
    }
}

class YMVideoDetailInfo: NSObject {
    
    var direct_play: Int?
    var group_flags: Int?
    var show_pgc_subscribe: Int?
    var video_id: String?
    var video_preloading_flag: Bool?
    var video_type: Int?
    var video_watch_count: Int?
    var video_watching_count: Int?
    
    init(dict: [String: AnyObject]) {
        super.init()
        video_watching_count = dict["video_watching_count"] as? Int
        video_watch_count = dict["video_watch_count"] as? Int
        video_type = dict["video_type"] as? Int
        video_preloading_flag = dict["video_preloading_flag"] as? Bool
        video_id = dict["video_id"] as? String
        direct_play = dict["direct_play"] as? Int
        group_flags = dict["group_flags"] as? Int
        show_pgc_subscribe = dict["show_pgc_subscribe"] as? Int
        
    }
}

class YMDetailVideoLargeImage: NSObject {
    
    var hight: Int?
    var width: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list: [[String: AnyObject]]?
    
    init(dict: [String: AnyObject]) {
        super.init()
        hight = dict["hight"] as? Int
        width = dict["width"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        url_list = dict["url_list"] as? [[String: AnyObject]] ?? [[:]]
    }
}
