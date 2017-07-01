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
    // 当前选中的 titleLabel 的 上一个 titleLabel
    var oldIndex: Int = 0
    
    var titles = [HomeTopTitle]()
    
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
        let homeNavigationBar = HomeNavigationBar()
        homeNavigationBar.searchBar.delegate = self
        return homeNavigationBar
    }()
    /// 标题
    fileprivate lazy var pageView: PageView = {
        let pageView = PageView()
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
        
        view.addSubview(pageView)
        pageView.pageContentView.delegate = self
        pageView.pageContentView.dataSource = self
        pageView.titleScrollView.delegate = self
        pageView.titleScrollView.scrollView.delegate = self

        pageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(kNavBarHeight)
            make.left.right.equalTo(view)
            make.bottom.equalTo(-kTabBarHeight)
        }
        
        pageView.titleScrollView.homeTitleArrayClosure { (homeTitles, homeTopicVCs) in
            self.titles = homeTitles
            for vc in homeTopicVCs {
                self.addChildViewController(vc)
            }
            self.pageView.pageContentView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - VideoTitleViewDelegate
extension HomeViewController: PageTitleViewDelegate {
    /// VideoTitleViewDelegate
    func pageTitle(pageTitle: PageTitleView, didClickSearchButton searchButton: UIButton) {
        print("点击了加号按钮")
    }
    
    func pageTitle(pageTitle: PageTitleView, didSelectPageTitleLable titleLabel: TitleLabel) {
        var offset = pageView.pageContentView.contentOffset
        offset.x = CGFloat(titleLabel.tag) * pageView.pageContentView.width
        pageView.pageContentView.setContentOffset(offset, animated: true)
    }
}

// MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    /// UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / screenWidth)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    // scrollView 刚开始滑动时
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / screenWidth)
        // 记录刚开始拖拽是的 index
        self.oldIndex = index
    }
    
    /// scrollView 结束滑动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / screenWidth)
        // 与刚开始拖拽时的 index 进行比较
        // 检查是否需要改变 label 的位置
        pageView.titleScrollView.adjustVideoTitleOffSetToCurrentIndex(currentIndex: index, oldIndex: self.oldIndex)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeTopicViewCell", for: indexPath)
        let topVC = childViewControllers[indexPath.row] as! HomeTopViewController
        topVC.homeTopTitle = titles[indexPath.row]
        cell.contentView.addSubview(topVC.view)
        topVC.view.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(cell)
        }
        return cell
    }
}


// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    /// UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationController?.pushViewController(HomeSearchViewController(), animated: false)
        return true
    }
}
