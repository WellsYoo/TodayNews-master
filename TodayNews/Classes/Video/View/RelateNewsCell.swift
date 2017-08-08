//
//  RelateNewsCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/8.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class RelateNewsCell: UITableViewCell {
    
    var relateNews: WeiTouTiao? {
        didSet {
            newTitleLabel.text = relateNews!.title! as String
            if let user_info = relateNews!.user_info {
                thumbImageView.kf.setImage(with: URL(string: user_info.avatar_url!)!)
                usernameLabel.text = user_info.name!
            }
            playCountLabel.text = relateNews!.readCount! + "次播放"
            videoTimeLabel.text = relateNews!.video_duration!
        }
    }

    @IBOutlet weak var newTitleLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var playCountLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var videoTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
