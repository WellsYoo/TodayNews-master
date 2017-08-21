//
//  HomeUserCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/21.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class HomeUserCell: UITableViewCell {
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            verifiedContentLabel.text = weitoutiao!.verified_content!
            digButton.setTitle(weitoutiao!.diggCount!, for: .normal)
            commentButton.setTitle("\(weitoutiao!.commentCount!)阅读", for: .normal)
            feedshareButton.setTitle(weitoutiao!.repinCount!, for: .normal) // 参数不正确
        }
    }

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var vipImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var verifiedContentLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var readCountLabel: UILabel!
    @IBOutlet weak var concernButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var digButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var feedshareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
