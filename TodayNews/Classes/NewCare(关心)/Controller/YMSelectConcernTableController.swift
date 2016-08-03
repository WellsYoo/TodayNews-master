//
//  YMConcernDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  关心界面 -> 点击了一个 cell -> 选中关注的 列表界面
//

import UIKit
import Kingfisher

let concernDetailCellID = "concernDetailCellID"

class YMSelectConcernTableController: UIViewController {

    var tableView: UITableView?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = YMGlobalColor()
        
        view.addSubview(bgImageView)
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: concernDetailCellID)
        view.addSubview(tableView)
        self.tableView = tableView
        
        bgImageView.snp_makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(0)
            make.height.equalTo(150)
        }
        
        tableView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(bgImageView.snp_bottom)
        }
        
    }
    
    func rightBBItemClick() {
        
    }
    
    /// 懒加载，创建背景图片
    lazy var bgImageView: YMBlurImageView = {
        let bgImageView = YMBlurImageView(frame: CGRectZero)
        bgImageView.image = UIImage(named: "hrscy")
        bgImageView.delegate = self
        return bgImageView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension YMSelectConcernTableController: UITableViewDataSource, UITableViewDelegate, YMBlurImageViewDelegate {
    
    // MARK: - YMBlurImageViewDelegate
    func blurImageView(blurImage: YMBlurImageView, titleButton: UIButton) {
        
    }
    
    /// 返回按钮点击
    func blurImageView(blurImage: YMBlurImageView, backButton: UIButton) {
         navigationController?.popViewControllerAnimated(true)
    }
    
    /// 覆盖按钮点击
    func blurImageView(blurImage: YMBlurImageView, coverButton: UIButton) {
        let concernDetailVC = YMConcernDetailViewController()
        navigationController?.pushViewController(concernDetailVC, animated: true)
    }
    
    /// 关心按钮点击
    func blurImageView(blurImage: YMBlurImageView, careButton: UIButton) {
        
    }
    
    /// 分享按钮点击
    func blurImageView(blurImage: YMBlurImageView, shareButton: UIButton) {
        
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(concernDetailCellID)
        cell?.textLabel?.text = "测试数据--\(indexPath.row)"
        return cell!
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY <= 0 {
            
        } else {
            
        }
//        if offsetY <= 0 {
//            bgImageView.snp_updateConstraints(closure: { (make) in
//                make.height.equalTo(150)
//            })
//            bgImageView.avaterImageView.alpha = 1
//            bgImageView.peopleCountLabel.alpha = 1
//            bgImageView.topicCountLabel.alpha = 1
//            bgImageView.introduceButton.alpha = 1
//            bgImageView.refreshImageView.alpha = 0
//            bgImageView.titltButton.snp_remakeConstraints(closure: { (make) in
//                make.top.equalTo(bgImageView.snp_bottom).offset(-70)
//                make.left.equalTo(bgImageView.snp_left).offset(85)
//            })
//            bgImageView.coverButton.hidden = true
//        } else if offsetY > 0 && offsetY <= 86{
//            var tempFrame = bgImageView.frame
//            tempFrame.size.height = 150 - offsetY
//            bgImageView.frame = tempFrame
//            bgImageView.snp_updateConstraints(closure: { (make) in
//                make.height.equalTo(tempFrame.size.height)
//            })
//            bgImageView.avaterImageView.alpha = 1 / offsetY
//            bgImageView.peopleCountLabel.alpha = 1 / offsetY
//            bgImageView.topicCountLabel.alpha = 1 / offsetY
//            bgImageView.introduceButton.alpha = 1 / offsetY
//            bgImageView.titltButton.centerX = SCREENW * 0.5
//            bgImageView.titltButton.snp_updateConstraints(closure: { (make) in
//                make.centerX.equalTo(bgImageView)
//                make.top.equalTo(bgImageView.snp_top).offset(45)
//            })
//            bgImageView.refreshImageView.alpha = offsetY * 0.01
//        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}
