//
//  YMTopic.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/3.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMHomeTopTitle: NSObject {
    
    var category: String?

    var tip_new: Int = 0

    var default_add: Int = 0

    var web_url: String?

    var concern_id: String?

    var icon_url: String?

    var flags: Int = 0

    var type: Int = 0

    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        category = dict["categorys"] as? String
        tip_new = dict["tip_new"] as! Int
        default_add = dict["default_add"] as! Int
        web_url = dict["web_url"] as? String
        concern_id = dict["concern_id"] as? String
        icon_url = dict["icon_url"] as? String
        flags = dict["flags"] as! Int
        type = dict["type"] as! Int
        name = dict["name"] as? String
    }
    
}
