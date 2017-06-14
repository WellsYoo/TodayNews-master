//
//  MoreLoginView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 2017/6/14.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit

class MoreLoginView: UIView {

    class func loginView() -> MoreLoginView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! MoreLoginView
    }
    
    

}
