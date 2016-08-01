//
//  YMVideoViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMVideoViewController: YMBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        navigationItem.title = ""
        titleBGView.addSubview(titleScrollView)
        titleBGView.addSubview(titleSearchButton)
        navigationItem.titleView = titleBGView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var titleSearchButton: UIButton = {
        let titleSearchButton = UIButton()
        titleSearchButton.setBackgroundImage(UIImage(named: "shadow_addolder_titlebar_44x36_"), forState: .Normal)
        titleSearchButton.backgroundColor = UIColor.redColor()
        titleSearchButton.frame = CGRectMake(SCREENW - 30, 0, 30, 44)
        return titleSearchButton
    }()
    
    
    private lazy var titleBGView: UIView = {
        let titleBGView = UIView()
        titleBGView.frame = CGRectMake(0, 0, SCREENW, 44)
        return titleBGView
    }()
    
    private lazy var titleScrollView: UIScrollView = {
        let titleScrollView = UIScrollView()
        titleScrollView.backgroundColor = UIColor.cyanColor()
        titleScrollView.frame = CGRectMake(0, 0, SCREENW - 30, 44)
        return titleScrollView
    }()

}
