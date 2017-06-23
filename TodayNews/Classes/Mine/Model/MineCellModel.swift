//
//  MineCell.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation

class MineCellModel {
    
    var grey_text: String?
//    var icons: [String: AnyObject]?
    var text: String?
    var url: String?
    var key: String?
    var tip_new: Int?
    
    init(dict: [String: AnyObject]) {
        grey_text = dict["grey_text"] as? String
        text = dict["text"] as? String
        url = dict["url"] as? String
        key = dict["key"] as? String
        tip_new = dict["tip_new"] as? Int
        
    }
    
}

class MyConcern {
    
    var name: String?
    var url: String?
    var total_count: Int?
    var description: String?
    var time: String?
    var type: String?
    var icon: String?
    
    init(dict: [String: AnyObject]) {
        name = dict["name"] as? String
        url = dict["url"] as? String
        total_count = dict["total_count"] as? Int
        description = dict["description"] as? String
        time = dict["time"] as? String
        type = dict["type"] as? String
        icon = dict["icon"] as? String
    }
}
