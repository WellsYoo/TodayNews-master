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

    var web_url: String?

    var concern_id: String?

    var icon_url: String?

    var name: String?
    
    var isSelected: Bool = true
    
    init(dict: [String: AnyObject]) {
        super.init()
        category = dict["category"] as? String
        web_url = dict["web_url"] as? String
        concern_id = dict["concern_id"] as? String
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        category = aDecoder.decodeObjectForKey("category") as? String
        web_url = aDecoder.decodeObjectForKey("web_url") as? String
        concern_id = aDecoder.decodeObjectForKey("concern_id") as? String
        icon_url = aDecoder.decodeObjectForKey("icon_url") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        isSelected = aDecoder.decodeBoolForKey("isSelected")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(category, forKey: "category")
        aCoder.encodeObject(web_url, forKey: "web_url")
        aCoder.encodeObject(concern_id, forKey: "concern_id")
        aCoder.encodeObject(icon_url, forKey: "icon_url")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeBool(isSelected, forKey: "isSelected")
    }
}
