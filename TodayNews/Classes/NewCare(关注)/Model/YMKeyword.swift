//
//  YMKeyword.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMKeyword: NSObject {
    var keyword: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        keyword = dict["keyword"] as? String
    }
    
}
