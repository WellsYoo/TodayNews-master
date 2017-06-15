//
//  MineCell.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import ObjectMapper

class MineCellModel: Mappable {
    
    var grey_text: String?
//    var icons: [String: AnyObject]?
    var text: String?
    var url: String?
    var key: String?
    var tip_new: Int = 0
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        grey_text <- map["grey_text"]
        text <- map["text"]
        url <- map["url"]
        key <- map["key"]
        tip_new <- map["tip_new"]
    }
}
