//
//  YMFlowLayout.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/4.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMFlowLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout()
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        itemSize = CGSizeMake(SCREENW, SCREENH - 64 - 49)
        scrollDirection = .Horizontal
        collectionView?.showsHorizontalScrollIndicator = false
    }
}
