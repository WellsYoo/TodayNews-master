//
//  HomeViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hrscy. All rights reserved.
//
// 1.首页 控制器

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置导航栏颜色
        navigationController?.navigationBar.barTintColor = UIColor.globalRedColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 自定义导航栏
    fileprivate lazy var homeNavigationBar: HomeNavigationBar = {
        let homeNavigationBar = HomeNavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: kNavBarHeight))
        homeNavigationBar.searchBar.delegate = self
        return homeNavigationBar
    }()
    
    fileprivate lazy var pageView: PageView = {
        let pageView = PageView()
        pageView.delegate = self
        return pageView
    }()
}

extension HomeViewController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        // 设置导航栏属性
        navigationController?.navigationBar.barStyle = .black
        // 自定义导航栏
        navigationItem.titleView = homeNavigationBar
        // 添加 滚动分页视图
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view.snp.top).offset(kNavBarHeight)
            make.bottom.equalTo(view.snp.bottom).offset(-kTabBarHeight)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

// MARK: - PageViewDelegate
extension HomeViewController: PageViewDelegate {
    /// 右侧按钮点击
    func pageViewRightButtonClicked() {
        
    }
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    /// UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationController?.pushViewController(HomeSearchViewController(), animated: true)
        return true
    }
}
