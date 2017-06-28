//
//  FollowDetailViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/25.
//  Copyright © 2017年 hrscy. All rights reserved.
//
//  关注详情
//

import UIKit

class FollowDetailViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    var userid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        NetworkTool.loadOneFollowDetail(userId: userid) { (followDetail) in
            self.headerView.follewDetail = followDetail
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 导航条
    fileprivate lazy var navView: ConcernNavigationView = {
        let navView = ConcernNavigationView.concernNavView()
        navView.delegate = self
        return navView
    }()
    /// 头部
    fileprivate lazy var headerView: ConcernHeaderView = {
        let headerView = ConcernHeaderView.headerView()
        return headerView
    }()
    /// scrolView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
}

extension FollowDetailViewController {
    
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(headerView)
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight + 200)
        view.addSubview(navView)
    }
}

// MARK: - ConcernNavigationViewDelegate
extension FollowDetailViewController: ConcernNavigationViewDelegate {
    /// 返回按钮点击
    func concernHeaderViewReturnButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    /// 更多按钮点击
    func concernHeaderViewMoreButtonClicked() {
        
    }
}

// MARK: - UIScrollViewDelagate
extension FollowDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if offsetY < 0 {
            let totalOffset = kConcernHeaderViewHieght + abs(offsetY)
            let f = totalOffset / kConcernHeaderViewHieght
            headerView.bgImageView.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
            navView.backgroundColor = UIColor.clear
        }
        if offsetY > 0 {
            var alpha = offsetY / kNavBarHeight
            alpha = min(alpha, 1)
            navView.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            if alpha >= 1 {
                navView.returnButton.setImage(UIImage(named: "lefterbackicon_titlebar_24x24_"), for: .normal)
                navView.moreButton.setImage(UIImage(named: "More_24x24_"), for: .normal)
            } else {
                navView.returnButton.setImage(UIImage(named: "leftbackicon_white_titlebar_24x24_"), for: .normal)
                navView.moreButton.setImage(UIImage(named: "more_titlebar_24x24_"), for: .normal)
            }
        }
    }
}


