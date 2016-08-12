//
//  YMHomeShare.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMHomeShare: NSObject {
    
    var icon: NSString?
    
    var icon_night: NSString?
    
    var title: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        icon = dict["icon"] as? String
        icon_night = dict["icon_night"] as? String
        title = dict["title"] as? String
    }
}
