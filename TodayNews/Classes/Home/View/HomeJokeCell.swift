//
//  HomeJokeCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/11.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class HomeJokeCell: UITableViewCell {
    
    var joke: WeiTouTiao? {
        didSet {
            jokeLabel.text = joke!.content! as String
            if joke!.comment_count! == 0 {
                commentButton.setTitle("评论", for: .normal)
            } else {
                commentButton.setTitle(String(describing: joke!.comment_count!), for: .normal)
            }
            likeButton.setTitle(joke!.diggCount, for: .normal)
            dislikeButton.setTitle(joke!.buryCount!, for: .normal)
        }
    }
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        starButton.setImage(UIImage(named: "love_video_press_20x20_"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
