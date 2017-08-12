//
//  HomeDetailController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/8.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import MJRefresh
import SVProgressHUD
import Kingfisher
import IBAnimatable

class TopicDetailController: UIViewController {
    
    fileprivate let disposeBag = DisposeBag()
    
    var comments = [NewsDetailImageComment]()
    var relateNews = [WeiTouTiao]()
    
    @IBOutlet weak var tableView: UITableView!
    
    var weitoutiao: WeiTouTiao? {
        didSet {
            if let user = weitoutiao!.user {
                navView.usernameLabel.text = user.name
                navView.avatarImageView.kf.setImage(with: URL(string: user.avatar_url!))
            } else if let userInfo = weitoutiao!.user_info {
                navView.usernameLabel.text = userInfo.name
                navView.avatarImageView.kf.setImage(with: URL(string: userInfo.avatar_url!))
            } else if let mediaInfo = weitoutiao!.media_info {
                navView.usernameLabel.text = mediaInfo.name
                navView.avatarImageView.kf.setImage(with: URL(string: mediaInfo.avatar_url!))
            }
            headerView.weitoutiao = weitoutiao!
            headerView.height = 45 + 2 * kMargin + weitoutiao!.newDetailTitleHeight!
//            let request = URLRequest(url: URL(string: weitoutiao!.article_url!)!)
//            webView.load(request)
//            webView.frame = CGRect(x: 0, y: headerView.frame.maxY, width: screenWidth, height: screenHeight - headerView.frame.maxY)
            /// 获取相关新闻
            NetworkTool.loadNewsDetailRelateNews(fromCategory: "", item_id: weitoutiao!.item_id!, group_id: weitoutiao!.group_id!) { (relateNews) in
                var relateTableHeight: CGFloat = 0
                for relatenews in relateNews {
                    relateTableHeight += relatenews.relateNewsCellHeight!
                }
                self.backHeaderView.addSubview(self.headerView)
                self.backHeaderView.addSubview(self.relateNewsTableView)
                self.relateNewsTableView.frame = CGRect(x: 0, y: self.headerView.frame.maxY, width: screenWidth, height: relateTableHeight)
                self.backHeaderView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: self.relateNewsTableView.frame.maxY)
                self.tableView.tableHeaderView = self.backHeaderView
                self.relateNews = relateNews
                self.relateNewsTableView.reloadData()
            }
            /// 获取评论
            NetworkTool.loadNewsDetailComments(offset: 0, item_id: weitoutiao!.item_id!, group_id: weitoutiao!.group_id!) { (comments) in
                self.comments = comments
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// 头部 标题，用户名，关注按钮
    fileprivate lazy var headerView: NewsDetailHeaderView = {
        let headerView = NewsDetailHeaderView.headerView()
        headerView.x = 0
        headerView.y = 0
        return headerView
    }()
    
    /// 相关新闻的 tableView
    fileprivate lazy var relateNewsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.estimatedRowHeight = 44
        tableView.register(UINib(nibName: String(describing: DetailRelateNewsCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DetailRelateNewsCell.self))
        return tableView
    }()
    
    
    
    /// 评论的头部
    fileprivate lazy var backHeaderView: UIView = {
        let backHeaderView = UIView()
        return backHeaderView
    }()
    
    /// 导航条
    fileprivate lazy var navView: ConcernNavigationView = {
        let navView = ConcernNavigationView.concernNavView()
        navView.returnButton.setImage(UIImage(named: "lefterbackicon_titlebar_24x24_"), for: .normal)
        navView.moreButton.setImage(UIImage(named: "More_24x24_"), for: .normal)
        navView.delegate = self
        navView.bottomLine.isHidden = false // 显示分割线
        return navView
    }()
    
    fileprivate lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
}

extension TopicDetailController: UITableViewDelegate, UITableViewDataSource {
    /// cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == relateNewsTableView {
            let relateNew = relateNews[indexPath.row]
            return relateNew.relateNewsCellHeight!
        } else {
            let comment = comments[indexPath.row]
            return comment.cellHeight!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == relateNewsTableView ? relateNews.count : comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == relateNewsTableView {
            let cell = relateNewsTableView.dequeueReusableCell(withIdentifier: String(describing: DetailRelateNewsCell.self), for: indexPath) as! DetailRelateNewsCell
            let relatenews = relateNews[indexPath.row]
            cell.contenLabel.text = relatenews.title! as String
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsDetailImageCommentCell.self), for: indexPath) as! NewsDetailImageCommentCell
            cell.comment = comments[indexPath.row]
            cellClickedEvent(cell: cell)
            return cell
        }
    }
    
    /// 设置 presnet 出来的控制器
    private func setupPresentationController(cell: NewsDetailImageCommentCell) {
        let followDetailVC = FollowDetailViewController()
        followDetailVC.userid = cell.comment!.user_id!
        followDetailVC.dismissalAnimationType = .cover(from: .right)
        followDetailVC.presentationAnimationType = .cover(from: .right)
        followDetailVC.modalSize = (width: .full, height: .full)
        self.present(followDetailVC, animated: true, completion: nil)
    }
    
    /// cell 按钮点击事件
    private func cellClickedEvent(cell: NewsDetailImageCommentCell) {
        // 头像按钮点击
        cell.avatarButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self!.setupPresentationController(cell: cell)
            })
            .addDisposableTo(disposeBag)
        // 用户名点击
        cell.nameLabel.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self!.setupPresentationController(cell: cell)
            })
            .addDisposableTo(disposeBag)
        // 点击了 评论内容或者回复
        cell.coverReplayButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: {
                
            })
            .addDisposableTo(disposeBag)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if offsetY > 0 {
            // 把 头部的用户图片的 frame 转换到 view 的坐标
            let rect = headerView.convert(headerView.avatarImageView.frame, to: view)
            if rect.origin.y <= 0 {
                navView.vipImageView.isHidden = false
                navView.avatarImageView.isHidden = false
                navView.usernameLabel.isHidden = false
                navView.concernButton.isHidden = false
                if let userVerified = weitoutiao!.user_verified {
                    navView.vipImageView.isHidden = !userVerified
                }
            } else {
                navView.vipImageView.isHidden = true
                navView.avatarImageView.isHidden = true
                navView.usernameLabel.isHidden = true
                navView.concernButton.isHidden = true
            }
        }
    }
}

extension TopicDetailController {
    
    func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String( describing: NewsDetailImageCommentCell.self), bundle: nil), forCellReuseIdentifier: String( describing: NewsDetailImageCommentCell.self))
        
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { [weak self] in
            // 获取评论数据
            NetworkTool.loadNewsDetailComments(offset: self!.comments.count, item_id: self!.weitoutiao!.item_id!, group_id: self!.weitoutiao!.group_id!) { (comments) in
                self!.tableView.mj_footer.endRefreshing()
                if comments.count == 0 {
                    SVProgressHUD.setForegroundColor(UIColor.white)
                    SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.3))
                    SVProgressHUD.showInfo(withStatus: "没有更多评论啦~")
                    return
                }
                self!.comments += comments
                self!.tableView.reloadData()
            }
        })
        
//        view.addSubview(headerView)
        view.addSubview(navView)
    }
}

// MARK: - ConcernNavigationViewDelegate
extension TopicDetailController: ConcernNavigationViewDelegate {
    /// 返回按钮点击
    func concernHeaderViewReturnButtonClicked() {
        if (navigationController != nil) {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    /// 更多按钮点击
    func concernHeaderViewMoreButtonClicked() {
        
    }
}
