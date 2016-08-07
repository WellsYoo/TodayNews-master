//
//  UIImageView+Extension.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  UIImageView 设置圆角
//

import UIKit
import Kingfisher

extension UIImageView {
    func setCircleHeader(url: String) {
        let placeholder = UIImage(named: "home_head_default_29x29_")
        self.kf_setImageWithURL(NSURL(string: url)!)
        self.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: placeholder, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            self.image = (image == nil) ? placeholder : image?.circleImage()
        }
    }
}
