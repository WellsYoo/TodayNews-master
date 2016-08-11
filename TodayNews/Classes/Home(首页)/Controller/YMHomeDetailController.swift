//
//  YMHomeDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/11.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  点击一条新闻 -> 新闻详情(或是一个新的新闻专题列表)
//

import UIKit
import SnapKit

class YMHomeDetailController: UIViewController {
    
    var newTopic: YMNewsTopic?
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = YMColor(210, g: 63, b: 66, a: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more_right_topic_night_24x24_"), style: .Plain, target: self, action: #selector(homeDetailBBItemClick))
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .Default
        view.addSubview(scrollView)
        
        view.addSubview(bottomView)
        
        scrollView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(bottomView.snp_top)
        }
        
        bottomView.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(45)
        }
    }
    
    func homeDetailBBItemClick() {
        
    }
    
    private lazy var bottomView: YMHomeDetailBottomView = {
        let bottomView = NSBundle.mainBundle().loadNibNamed(String(YMHomeDetailBottomView), owner: nil, options: nil).last as! YMHomeDetailBottomView
        return bottomView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.contentInset = UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
        return scrollView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.systemFontOfSize(17)
        
        return titleLabel
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }

}
