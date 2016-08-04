//
//  YMVideoTopicController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/5.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let videoTopicCellID = "YMVideTopicCell"

class YMVideoTopicController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        let nib = UINib(nibName: String(YMVideoTopicCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: videoTopicCellID)
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(videoTopicCellID) as! YMVideoTopicCell
        cell.textLabel?.text = "\(navigationItem.title)----\(indexPath.row)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
