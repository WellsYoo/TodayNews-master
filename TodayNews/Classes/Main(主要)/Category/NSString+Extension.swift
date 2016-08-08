//
//  NSString+Extension.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/8.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

extension NSString {
    
    
    class func boundingRectWithString(string: NSString, size: CGSize) -> CGFloat {
        return string.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size.height
    }
}
