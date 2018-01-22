//
//  VideoDetailViewController.swift
//  News
//
//  Created by 杨蒙 on 2018/1/19.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import BMPlayer
import RxSwift
import RxCocoa
import SnapKit
import SVProgressHUD

class VideoDetailViewController: UIViewController {
    /// 播放器
    private lazy var player: BMPlayer = BMPlayer(customControlView: BMPlayerControlView())
    /// 当前视频数据
    var video = NewsModel()
    /// 评论数据
    private var comments = [DongtaiComment]()
    /// 喜欢按钮
    @IBOutlet weak var loveButton: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
    private let disposeBag = DisposeBag()
    /// 用户信息 view
    private lazy var userView = VideoDetailUserView.loadViewFromNib()
    /// tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.ym_registerCell(cell: DongtaiCommentCell.self)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    /// 返回按钮
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self!.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        backButton.setImage(UIImage(named: "personal_home_back_white_24x24_"), for: .normal)
        return backButton
    }()
    
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
        // 设置播放器，修改属性
        setupUI()
        // 获取数据
        loadNetwork()
        // 添加点击事件
        addAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        // 使用手势返回的时候，调用下面方法手动销毁
        player.prepareToDealloc()
    }
    
}

extension VideoDetailViewController {
    /// 设置播放器，修改属性
    private func setupUI() {
        loveButton.theme_setImage("images.love_video_20x20_", forState: .normal)
        loveButton.theme_setImage("images.love_video_press_20x20_", forState: .selected)
        
        view.addSubview(player)
        view.addSubview(backButton)
        view.addSubview(userView)
        view.addSubview(tableView)
        
        player.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(isIPhoneX ? 40 : 0)
            $0.left.right.equalTo(view)
            $0.height.equalTo(view.snp.width).multipliedBy(9.0 / 16.0)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalTo(view).offset(10)
            $0.size.equalTo(CGSize(width: 35, height: 35))
            $0.top.equalTo(player.snp.top).offset(10)
        }
        
        userView.snp.makeConstraints {
            $0.top.equalTo(player.snp.bottom)
            $0.left.right.equalTo(view)
            $0.height.equalTo(45)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(userView.snp.bottom)
            $0.bottom.equalTo(bottomView.snp.top)
            $0.left.right.equalTo(view)
        }
    }
    
    /// 获取数据
    private func loadNetwork() {
        // 需要先获取视频的真实播放地址
        NetworkTool.parseVideoRealURL(video_id: video.video_detail_info.video_id, completionHandler: {
            // 设置视频播放地址
            self.player.setVideo(resource: BMPlayerResource(url: URL(string: $0.video_list.video_1.mainURL)!))
        })
        // 视频详情数据
        NetworkTool.loadArticleInformation(from: "click_video", itemId: video.item_id, groupId: video.group_id) {
            self.userView.userInfo = $0.user_info
            // 添加相关视频界面
            // 两种方式：
            // 1.使用子控制器的方式，分别添加 tableView 的头部和尾部，但是这样第一次显示的时候，头部下方会显示很大空白，并且尾部显示不出来
            //            let relatedVideoVC = RelatedVideoTableViewController()
            //            self.addChildViewController(relatedVideoVC)
            //            relatedVideoVC.videoDetail = $0
            //            relatedVideoVC.video = self.video
            //            relatedVideoVC.tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: relatedVideoVC.tableView.contentSize.height)
            //            self.tableView.tableHeaderView = relatedVideoVC.tableView
            // 1.使用自定义 view
            let relatedVideoView = RelatedVideoView()
            relatedVideoView.video = self.video
            relatedVideoView.videoDetail = $0
            self.tableView.tableHeaderView = relatedVideoView
            relatedVideoView.didSelectCheckMoreButton = { [weak self] in
                self!.tableView.tableHeaderView = relatedVideoView
            }
        }
        /// 添加上拉刷新
        tableView.mj_footer = RefreshAutoGifFooter(refreshingBlock: { [weak self] in
            // 获取用户详情一般的详情的评论数据
            NetworkTool.loadUserDetailNormalDongtaiComents(groupId: self!.video.group_id, offset: self!.comments.count, count: 20, completionHandler: {
                if self!.tableView.mj_footer.isRefreshing { self!.tableView.mj_footer.endRefreshing() }
                self!.tableView.mj_footer.pullingPercent = 0.0
                if $0.count == 0 {
                    self!.tableView.mj_footer.endRefreshingWithNoMoreData()
                    SVProgressHUD.showInfo(withStatus: "没有更多数据啦!")
                    return
                }
                self!.comments += $0
                self!.tableView.reloadData()
            })
        })
        tableView.mj_footer.beginRefreshing()
    }
}

// MARK: - 添加点击事件
extension VideoDetailViewController {
    
    /// 添加点击事件
    private func addAction() {
        // 覆盖按钮点击
        userView.coverButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] (_) in
                let userDetailVC = UserDetailViewController2()
                userDetailVC.userId = self!.userView.userInfo.user_id
                self!.navigationController?.pushViewController(userDetailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    /// 评论点击
    @IBAction func commentButtonClicked(_ sender: UIButton) {
        
    }
    /// 喜欢点击
    @IBAction func loveButtonClicked(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            sender.imageView?.transform = CGAffineTransform(scaleX: sender.imageView!.width * 0.2, y: sender.imageView!.width * 0.2)
        }) { (_) in
            sender.imageView?.transform = .identity
            sender.isSelected = !sender.isSelected
        }
    }
    /// 分享点击
    @IBAction func shareButtonClicked(_ sender: UIButton) {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension VideoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as DongtaiCommentCell
        cell.comment = comments[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = comments[indexPath.row]
        let postCommentView = PostCommentView.loadViewFromNib()
        if comment.screen_name != "" {
            postCommentView.placeholderLabel.text = "回复 \(comment.screen_name):"
        } else if comment.user.user_id != 0 {
            if comment.user.screen_name != "" {
                postCommentView.placeholderLabel.text = "回复 \(comment.user.screen_name):"
            }
        }
        view.addSubview(postCommentView)
    }
}
