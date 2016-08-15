//
//  YMOfflineTableViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/15.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  我的 -> 离线 -> 离线下载
//

import UIKit
let offlineCellID = "YMOfflineCell"

/// ![](http://obna9emby.bkt.clouddn.com/news/offline-download_spec.png)
class YMOfflineTableViewController: UITableViewController {
    
    var titles = [YMHomeTopTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 反归档
        unarchiveTitles()
        // 下载按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下载", style: .Plain, target: self, action: #selector(offlineBBItemClick))
        let nib = UINib(nibName: String(YMOfflineCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: offlineCellID)
        tableView.tableFooterView = UIView()
    }
    
    /// 反归档
    private func unarchiveTitles() {
        let path: NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first!
        let filePath = path.stringByAppendingPathComponent("top_titles.archive")
        titles = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! Array
    }
    
    func offlineBBItemClick() {
        print(#function)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YMOfflineTableViewController {
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let topTitle = titles[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(offlineCellID) as! YMOfflineCell
        cell.selectionStyle = .None
        cell.topTitle = topTitle
        cell.selectedImageView.image = UIImage(named: (topTitle.isSelected ? "air_download_option_press_20x20_" : "air_download_option_20x20_"))
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let topTitle = titles[indexPath.row]
        topTitle.isSelected = !topTitle.isSelected
        let cell = tableView.dequeueReusableCellWithIdentifier(offlineCellID) as! YMOfflineCell
        cell.selectedImageView.image = UIImage(named: (topTitle.isSelected ? "air_download_option_press_20x20_" : "air_download_option_20x20_"))
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        titles.removeAtIndex(indexPath.row)
        titles.insert(topTitle, atIndex: indexPath.row)
        // 重新归档数据
        archiveTitles(titles)
    }
    
    /// 归档标题数据
    private func archiveTitles(titles: [YMHomeTopTitle]) {
        let path: NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first!
        let filePath = path.stringByAppendingPathComponent("top_titles.archive")
        // 归档
        NSKeyedArchiver.archiveRootObject(titles, toFile: filePath)
    }
}
