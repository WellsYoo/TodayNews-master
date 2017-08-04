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
    
    var src: String?

    var img_width: CGFloat?
    
    var img_height: CGFloat?
    
    
    init(dict: [String: AnyObject]) {
        
    }
}
