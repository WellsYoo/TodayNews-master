//
//  QuestionAnswerController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/13.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class QuestionAnswerController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var moreAnswerButton: UIButton!
    @IBOutlet weak var moreImageView: UIImageView!
    
    var topicTitle: TopicTitle?
    
    var weitoutiao: WeiTouTiao?
    
    var questionAnswer: QuestionAnswer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 悟空问答
        NetworkTool.loadQuestionAnswerList(topicTitle: topicTitle!, weitoutiao: weitoutiao!) { (questionAnswer) in
            self.questionAnswer = questionAnswer
            let module = questionAnswer.module_list.first
            self.moreImageView.kf.setImage(with: URL(string: module!.day_icon_url!))
            self.moreAnswerButton.setTitle(module!.text!, for: .normal)
        }
        
    }
    /// 左侧按钮点击
    @IBAction func moreAnswerButtonClicked(_ sender: UIButton) {
        
    }
    /// 底部回答按钮点击
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        
    }
    
}
