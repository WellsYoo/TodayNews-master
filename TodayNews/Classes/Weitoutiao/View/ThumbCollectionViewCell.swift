//
//  ThumbCollectionViewCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/16.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class ThumbCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var thumbImageURL: String? {
        didSet {
            thumbImageView.kf.setImage(with: URL(string: thumbImageURL!))
        }
    }
}
