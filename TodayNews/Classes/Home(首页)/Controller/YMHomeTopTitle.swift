//
//  YMTopic.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/3.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation

class YMHomeTopTitle: NSObject, NSCoding {
    
    var category: String?

    var tip_new: Int?

    var default_add: Int?

    var web_url: String?

    var concern_id: String?

    var icon_url: String?

    var flags: Int?

    var type: Int?

    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        category = dict["category"] as? String
        tip_new = dict["tip_new"] as? Int
        default_add = dict["default_add"] as? Int
        web_url = dict["web_url"] as? String
        concern_id = dict["concern_id"] as? String
        icon_url = dict["icon_url"] as? String
        flags = dict["flags"] as? Int
        type = dict["type"] as? Int
        name = dict["name"] as? String
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        category = aDecoder.decodeObjectForKey("category") as? String
        tip_new = aDecoder.decodeObjectForKey("tip_new") as? Int
        default_add = aDecoder.decodeObjectForKey("default_add") as? Int
        web_url = aDecoder.decodeObjectForKey("web_url") as? String
        concern_id = aDecoder.decodeObjectForKey("concern_id") as? String
        icon_url = aDecoder.decodeObjectForKey("icon_url") as? String
        flags = aDecoder.decodeObjectForKey("flags") as? Int
        type = aDecoder.decodeObjectForKey("type") as? Int
        name = aDecoder.decodeObjectForKey("name") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(category, forKey: "category")
//        aCoder.encodeObject(category, forKey: "category")
//        aCoder.encodeObject(category, forKey: "category")
//        aCoder.encodeObject(category, forKey: "category")
//        aCoder.encodeObject(category, forKey: "category")
        
        
    }
}
