//
//  HomeTopTitle.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation

class HomeTopTitle {

    var category: String?
    
    var web_url: String?
    
    var concern_id: String?
    
    var icon_url: String?
    
    var name: String?
    
    var isSelected: Bool = true
    
    init(dict: [String: AnyObject]) {
        category = dict["category"] as? String
        web_url = dict["web_url"] as? String
        concern_id = dict["concern_id"] as? String
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
    }

}
