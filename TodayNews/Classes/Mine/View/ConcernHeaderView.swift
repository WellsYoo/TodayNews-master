//
//  ConcernHeaderView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/27.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class ConcernHeaderView: UIView {
    /// 头像
    @IBOutlet weak var avaterImageView: UIImageView!
    /// 名称
    @IBOutlet weak var nameLabel: UILabel!
    /// 关注按钮
    @IBOutlet weak var concernButton: UIButton!
    /// 描述
    @IBOutlet weak var descriptionLabel: UILabel!
    /// 展开按钮
    @IBOutlet weak var unfoldButton: UIButton!
    /// 关注数量
    @IBOutlet weak var concernCountLabel: UILabel!
    /// 粉丝数量
    @IBOutlet weak var fansCountLabel: UILabel!
    /// 指示器
    @IBOutlet weak var indicatorView: UIView!
    /// 指示器的约束
    @IBOutlet weak var indicatorConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avaterImageView.layer.borderColor = UIColor.white.cgColor
        avaterImageView.layer.borderWidth = 1
        concernButton.layer.borderColor = UIColor.lightGray.cgColor
        concernButton.layer.borderWidth = 1
        
    }
    
    var follewDetail: FollowDetail? {
        didSet {
//            avaterImageView.kf.setImage(with: URL(string: (follewDetail?.avatar_url!)!))
            if let screen_name = follewDetail?.screen_name {
                nameLabel.text = screen_name
            } else if let name = follewDetail?.name {
                nameLabel.text = name
            }
            if let description = follewDetail?.description {
                descriptionLabel.text = description
            }
            concernCountLabel.text = String(describing: follewDetail?.followings_count!)
            fansCountLabel.text = String(describing: follewDetail?.followers_count!)
        }
    }
    
    /// 展开按钮点击了
    @IBAction func unfoldButtonClicked() {
        
    }
    
    /// 动态按钮点击
    @IBAction func dynamicButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) { 
            self.indicatorConstraint.constant = 0
        }
    }
    
    /// 文章按钮点击
    @IBAction func articleButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.indicatorConstraint.constant += sender.width
        }
    }
    
    /// 视频按钮点击
    @IBAction func videoButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.indicatorConstraint.constant += 2 * sender.width
        }
    }
    
    class func headerView() -> ConcernHeaderView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! ConcernHeaderView
    }
    
}
