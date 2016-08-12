//
//  YMShareVerticalButton.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  分享的竖直按钮
//

import UIKit

class YMShareVerticalButton: UIButton {

    var homeShare: YMHomeShare? {
        didSet {
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.centerX = self.width * 0.5
        imageView?.y = 0
        imageView?.width = 60
        imageView?.height = 60
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height + 7
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.y
    }

}
