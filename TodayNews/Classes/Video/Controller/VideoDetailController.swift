//
//  VideoDetailController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MJRefresh
import SnapKit

class VideoDetailController: UIViewController {
    
    fileprivate let disposeBag = DisposeBag()
    
    var item_id: Int = 0
    var group_id: Int = 0
    var offset: Int = 0
    
    var relateNews = [WeiTouTiao]()
    var comments = [NewsDetailImageComment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    // 相关新闻
    fileprivate lazy var relateTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.register(UINib(nibName: String( describing: NewsDetailImageCommentCell.self), bundle: nil), forCellReuseIdentifier: String( describing: NewsDetailImageCommentCell.self))
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // 评论
    fileprivate lazy var commentTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.register(UINib(nibName: String( describing: NewsDetailImageCommentCell.self), bundle: nil), forCellReuseIdentifier: String( describing: NewsDetailImageCommentCell.self))
        tableView.separatorStyle = .none
        return tableView
    }()
}

extension VideoDetailController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        scrollView.addSubview(relateTableView)
        scrollView.addSubview(commentTableView)
        
        relateTableView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(scrollView)
            make.bottom.equalTo(commentTableView.snp.top)
        }
        
        commentTableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(scrollView)
        }
        
        NetworkTool.loadNewsDetailRelateNews(item_id: item_id, group_id: group_id) { (relateNews) in
            self.relateNews = relateNews
            self.relateTableView.reloadData()
            self.scrollView.contentSize = CGSize(width: screenWidth, height: self.relateTableView.height + self.commentTableView.height)
        }
        
        // 获取评论数据
        NetworkTool.loadNewsDetailComments(offset: offset, item_id: item_id, group_id: group_id) { (comments) in
            self.comments = comments
            self.commentTableView.reloadData()
        }
        
        commentTableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { [weak self] in
            // 获取评论数据
            NetworkTool.loadNewsDetailComments(offset: self!.comments.count, item_id: self!.item_id, group_id: self!.group_id) { (comments) in
                self!.comments += comments
                self!.commentTableView.reloadData()
                self!.scrollView.contentSize = CGSize(width: screenWidth, height: self!.relateTableView.height + self!.commentTableView.height)
            }
        })
    }
}

extension VideoDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == relateTableView ? relateNews.count : comments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let comment = comments[indexPath.row]
        return comment.cellHeight!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == relateTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: String( describing: RelateNewsCell.self), for: indexPath) as! RelateNewsCell
            cell.relateNews = relateNews[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String( describing: NewsDetailImageCommentCell.self), for: indexPath) as! NewsDetailImageCommentCell
            cell.comment = comments[indexPath.row]
            cellClickedEvent(cell: cell)
            return cell
        }
    }
    
    /// cell 按钮点击事件
    private func cellClickedEvent(cell: NewsDetailImageCommentCell) {
        // 头像按钮点击
        cell.avatarButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self!.setupPushViewController(cell: cell)
            })
            .addDisposableTo(disposeBag)
        // 用户名点击
        cell.nameLabel.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self!.setupPushViewController(cell: cell)
            })
            .addDisposableTo(disposeBag)
        // 点击了 评论内容或者回复
        cell.coverReplayButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: {
                
            })
            .addDisposableTo(disposeBag)
    }
    
    // push
    fileprivate func setupPushViewController(cell: NewsDetailImageCommentCell) {
        let followDetailVC = FollowDetailViewController()
        followDetailVC.userid = cell.comment!.user_id!
        navigationController?.pushViewController(followDetailVC, animated: true)
    }
}
