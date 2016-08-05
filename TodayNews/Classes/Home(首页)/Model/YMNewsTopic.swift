//
//  YMNewsTopic.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/5.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMNewsTopic: NSObject {
    
    var abstract: String?
    
    var keywords: String?
    
    var title: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        abstract = dict["abstract"] as? String
        keywords = dict["keywords"] as? String
        title = dict["title"] as? String
        
    }
    
}
