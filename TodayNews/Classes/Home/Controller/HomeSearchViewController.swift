//
//  HomeSearchViewController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/13.
//  Copyright © 2017年 hrscy. All rights reserved.
//
//  首页顶部搜索框

import UIKit
import SnapKit

class HomeSearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 导航栏
    fileprivate lazy var searchNavigationView: SearchNavigationView = {
        let searchNavigationView = SearchNavigationView()
        searchNavigationView.delegate = self
        return searchNavigationView
    }()
    
    // 搜索界面默认的背景
    fileprivate lazy var searchDefaultBGView: SearchDefaultBackgroundView = {
        let searchDefaultBGView = SearchDefaultBackgroundView.defaultBackgroundView()
        return searchDefaultBGView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // 设置导航栏属性
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // 设置导航栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.globalBackgroundColor()
    }
}

extension HomeSearchViewController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
        // 隐藏返回按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        // 设置自定义导航视图
        navigationItem.titleView = searchNavigationView
        // 添加背景 View
        view.addSubview(searchDefaultBGView)
        // 布局
        searchDefaultBGView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view.snp.top).offset(kNavBarHeight)
            make.height.equalTo(188)
        }
    }
}

// MARK: - SearchNavigationViewDelegate
extension HomeSearchViewController: SearchNavigationViewDelegate {
    /// 导航栏取消按钮点击
    func cancelButtonClicked() {
        navigationController?.popViewController(animated: false)
    }
}
