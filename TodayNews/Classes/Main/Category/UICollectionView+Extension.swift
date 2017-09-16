//
//  UICollectionView+Extension.swift
//  News
//
//  Created by 杨蒙 on 2017/9/13.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

/// --------------------- UICollectionView extension ---------------------
extension UICollectionView {
    /// 注册 cell
    func ym_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: RegisterCellOrNib {
        if let xib = T.xib {
            // T 遵守了 RegisterCellOrNib 协议，所以通过 T 就能取出 identifier 这个属性
            register(xib, forCellWithReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    /// 获取可重用的 cell
    func ym_dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: RegisterCellOrNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
    /// 注册头部
    func ym_registerSupplementaryHeaderView<T: UICollectionReusableView>(reusableView: T.Type) where T: RegisterCellOrNib {
        if let xib = T.xib {
            // T 遵守了 RegisterCellOrNib 协议，所以通过 T 就能取出 identifier 这个属性
            register(xib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier)
        } else {
            register(reusableView, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier)
        }
    }
    
    /// 获取可重用的头部
    func ym_dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: RegisterCellOrNib {
        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
}
