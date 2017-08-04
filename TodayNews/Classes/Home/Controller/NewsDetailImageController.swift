//
//  NewsDetailImageController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/4.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class NewsDetailImageController: UIViewController {
    
    /// 加 V
    @IBOutlet weak var vipImageView: UIImageView!
    
    @IBOutlet weak var avatarButton: UIButton!
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            if let user_verified = weitoutiao!.user_verified {
                vipImageView.isHidden = !user_verified
            }
            if let user = weitoutiao!.user {
                avatarButton.kf.setImage(with: URL(string: (user.avatar_url)!), for: .normal)
            } else if let user_info = weitoutiao!.user_info {
                avatarButton.kf.setImage(with: URL(string: (user_info.avatar_url)!), for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// 关闭按钮点击
    @IBAction func closeNewsDetailImageViewControllerButtonClciked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /// 头像按钮点击
    @IBAction func avatarButtonClciked(_ sender: UIButton) {
        
    }
    
    /// 更过按钮点击
    @IBAction func moreButonClicked(_ sender: UIButton) {
        
    }
    /// 写评论
    @IBAction func writeButtonClicked(_ sender: UIButton) {
        
    }
    
    
}
