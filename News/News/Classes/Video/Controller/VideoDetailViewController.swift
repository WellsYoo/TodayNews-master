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

class VideoDetailViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    /// 播放器
    private lazy var player: BMPlayer = BMPlayer(customControlView: BMPlayerControlView())
    /// 当前视频数据
    var video = NewsModel()
    /// 视频真实数据
    var realVideo = RealVideo()
    /// 视频详情数据
    var videoDetail = VideoDetail()
    /// 喜欢按钮
    @IBOutlet weak var loveButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置播放器，修改属性
        setupUI()
        // 添加点击事件
        addAction()
    }
    
    /// 用户信息 view
    private lazy var userView = VideoDetailUserView.loadViewFromNib()
    
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
        // 需要先获取视频的真实播放地址
        NetworkTool.parseVideoRealURL(video_id: video.video_detail_info.video_id, completionHandler: {
            self.realVideo = $0
            // 设置视频播放地址
            self.player.setVideo(resource: BMPlayerResource(url: URL(string: $0.video_list.video_1.mainURL!)!))
        })
        // 视频详情数据
        NetworkTool.loadArticleInformation(from: "click_video", itemId: video.item_id, groupId: video.group_id) {
            self.videoDetail = $0
            self.userView.userInfo = $0.user_info
        }
        view.addSubview(player)
        view.addSubview(userView)
        
        player.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(isIPhoneX ? 40 : 0)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.height.equalTo(view.snp.width).multipliedBy(9.0 / 16.0)
        }
        
        userView.snp.makeConstraints {
            $0.top.equalTo(player.snp.bottom)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.height.equalTo(45)
        }
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
