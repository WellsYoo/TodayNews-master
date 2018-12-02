//
//  HomeViewController.swift
//  WellsNews
//
//  Created by Wells on 2018/12/1.
//  Copyright © 2018 Wells. All rights reserved.
//

import UIKit
import SGPagingView

class HomeViewController: UIViewController {
    /// 标题和内容
    private var pageTitleView: SGPageTitleView?
    private var pageContentView: SGPageContentScrollView?
    /// 自定义导航栏
    private lazy var navigationBar = HomeNavigationView.loadViewFromNib()
    
//    private lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}
