//
//  YMVideoTopTitle.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMVideoTopTitle: NSObject {

    var category: String?

    var tip_new: Int = 0

    var web_url: String?

    var icon_url: String?

    var flags: Int = 0

    var type: Int = 0

    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        category = dict["category"] as? String
        tip_new = dict["tip_new"] as! Int
        web_url = dict["web_url"] as? String
        icon_url = dict["icon_url"] as? String
        flags = dict["flags"] as! Int
        type = dict["type"] as! Int
        name = dict["name"] as? String
    }
}
