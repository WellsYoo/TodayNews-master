//
//  YMConcernDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  关心界面 -> 点击了一个 cell -> 详情界面
//

import UIKit
import Kingfisher

let concernDetailCellID = "concernDetailCellID"

class YMConcernDetailController: YMBaseViewController {

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
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.setBackgroundImage(UIImage(),forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        
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
        return bgImageView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension YMConcernDetailController: UITableViewDataSource, UITableViewDelegate {
    
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
        print(bgImageView.frame)
        let offsetY = scrollView.contentOffset.y
        if offsetY <= 86 {
            var tempFrame = bgImageView.frame
            tempFrame.size.height = 150 - offsetY
            bgImageView.frame = tempFrame
            bgImageView.snp_updateConstraints(closure: { (make) in
                make.height.equalTo(tempFrame.size.height)
            })
//            bgImageView.avaterImageView.alpha = 1 / offsetY
        }
        if offsetY < 0 {
            bgImageView.snp_updateConstraints(closure: { (make) in
                make.height.equalTo(150)
            })
//            bgImageView.avaterImageView.alpha = 1
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}
