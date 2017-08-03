//
//  NewsDetail.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/3.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation

class NewsDetail {
    
    
    var related_news: [AnyObject]?
    
    var ban_comment: Int?
    
    var user_digg: Int?
    
    var ban_bury: Int?
    
    var related_gallery: [AnyObject]?
    
    var is_wenda: Bool?
    
    var related_video_toutiao: [AnyObject]?
    
    var related_wenda: [AnyObject]?
    
    var is_stick: Int?
    
    var image_list = [WTTImageList]()
    var large_image_list = [WTTLargeImageList]()
    var ugc_cut_image_list = [WTTUgcCutImageList]()
    var thumb_image_list = [WTTThumbImageList]()
    
    
    init(dict: [String: AnyObject]) {
        
    }
    
}
