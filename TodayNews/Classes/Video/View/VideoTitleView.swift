//
//  YMVideoTitleView.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/17.
//  Copyright © 2017年 杨蒙. All rights reserved.
//

import UIKit
import SnapKit

protocol VideoTitleViewDelegate: class {
    /// 点击了标题
    func videoTitle(videoTitle: VideoTitleView, didSelectVideoTitleLable titleLabel: TitleLabel)
    func videoTitle(videoTitle: VideoTitleView, didClickSearchButton searchButton: UIButton)
}

class VideoTitleView: UIView {
    
    weak var delegate: VideoTitleViewDelegate?
    /// 顶部标题数组
    var titles = [TopTitle]()
    /// 存放标题 label 数组
    var labels = [TitleLabel]()
    var videoTopicVCs = [VideoTopicController]()
    /// 存放 label 的宽度
    fileprivate var labelWidths = [CGFloat]()
    /// 向外界传递 titles 数组
    var videoTitlesClosure: ((_ titleArray: [TopTitle], _ videoTopicVCs: [VideoTopicController])->())?
    /// 记录当前选中的下标
    fileprivate var currentIndex = 0
    /// 记录上一个下标
    fileprivate var oldIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 加载标题数据
        NetworkTool.loadVideoTitlesData { (videoTopTitles, videoTopicVCs) in
            // 添加推荐标题
            let dict = ["category": "video", "name": "推荐"]
            let videoTopTitle = TopTitle(dict: dict as [String : AnyObject])
            self.titles.append(videoTopTitle)
            self.titles += videoTopTitles
            let videoTopicVC = VideoTopicController()
            self.videoTopicVCs.append(videoTopicVC)
            self.videoTopicVCs += videoTopicVCs
            self.setupUI()
        }
    }
    
    /// 设置滚动视图
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    /// 顶部搜索按钮
    fileprivate lazy var titleSearchButton: UIButton = {
        let titleSearchButton = UIButton()
        titleSearchButton.addTarget(self, action: #selector(titleSearchButtonClick), for: .touchUpInside)
        titleSearchButton.setImage(UIImage(named: "search_24x24_"), for: .normal)
        return titleSearchButton
    }()
    
    /// 顶部搜索按钮点击
    @objc private func titleSearchButtonClick(button: UIButton) {
        delegate?.videoTitle(videoTitle: self, didClickSearchButton: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoTitleView {
    
    fileprivate func setupUI() {
        // 添加滚动视图
        addSubview(scrollView)
        // 添加搜索按钮
        addSubview(titleSearchButton)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(self)
            make.right.equalTo(titleSearchButton.snp.left)
        }
        
        titleSearchButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(self)
            make.width.equalTo(40)
        }
        
        /// 添加 label
        setupVideoTitlesLable()
        /// 设置 label 的位置
        setupVideoLabelsPosition()
        
        videoTitlesClosure?(titles, videoTopicVCs)
    }
    
    /// 添加 label
    private func setupVideoTitlesLable() {
        for (index, topic) in titles.enumerated() {
            let label = TitleLabel()
            label.text = topic.name
            label.tag = index
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelOnClick(_:)))
            label.addGestureRecognizer(tap)
            label.font = UIFont.systemFont(ofSize: 16)
            label.sizeToFit()
            label.width += 5
            labels.append(label)
            labelWidths.append(label.width)
            scrollView.addSubview(label)
        }
        let currentLabel = labels[currentIndex]
        currentLabel.textColor = UIColor(r: 232, g: 84, b: 85)
        currentLabel.currentScale = 1.1
    }
    
    /// 设置 label 的位置
    private func setupVideoLabelsPosition() {
        var titleX: CGFloat = 0.0
        let titleY: CGFloat = 0.0
        var titleW: CGFloat = 0.0
        let titleH = self.height
        
        for (index, label) in labels.enumerated() {
            titleW = labelWidths[index]
            titleX = kMargin
            if index != 0 {
                let lastLabel = labels[index - 1]
                titleX = lastLabel.frame.maxX + kMargin
            }
            label.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        }
        /// 设置 contentSize
        if let lastLabel = labels.last {
            scrollView.contentSize = CGSize(width: lastLabel.frame.maxX, height: 0)
        }
    }
    
    /// 暴露给外界，向外界传递 topic 数组
    func videoTitleArrayClosure(closure: @escaping (_ titleArray: [TopTitle], _ videoTopicVCs: [VideoTopicController])->()) {
        videoTitlesClosure = closure
    }
    
    /// 标题点击的方法
    func titleLabelOnClick(_ tap: UITapGestureRecognizer) {
        guard let  currentLabel = tap.view as? TitleLabel else {
            return
        }
        
        oldIndex = currentIndex
        currentIndex = currentLabel.tag
        let oldLabel = labels[oldIndex]
        oldLabel.textColor = UIColor.black
        oldLabel.currentScale = 1.0
        currentLabel.textColor = UIColor(r: 232, g: 84, b: 85)
        currentLabel.currentScale = 1.1
        
        // 改变 label 的位置
        adjustVideoTitleOffSetToCurrentIndex(currentIndex: currentIndex, oldIndex: oldIndex)
        // 获取点击的 titleLabel
        delegate?.videoTitle(videoTitle: self, didSelectVideoTitleLable: currentLabel)
    }
    
    /// 当点击标题的时候，检查是否需要改变 label 的位置
    func adjustVideoTitleOffSetToCurrentIndex(currentIndex: Int, oldIndex: Int) {
        guard oldIndex != currentIndex else {
            return
        }
        // 重新设置 label 的状态
        let currentLabel = labels[currentIndex]
        let oldLabel = labels[oldIndex]
        currentLabel.currentScale = 1.1
        currentLabel.textColor = UIColor(r: 232, g: 84, b: 85)
        oldLabel.textColor = UIColor.black
        oldLabel.currentScale = 1.0
        // 当前偏移量
        var offsetX = currentLabel.centerX - screenWidth * 0.5
        if offsetX < 0 {
            offsetX = 0
        }
        // 最大偏移量
        var maxOffsetX = scrollView.contentSize.width - (screenWidth - titleSearchButton.width)
        
        if maxOffsetX < 0 {
            maxOffsetX = 0
        }
        
        if offsetX > maxOffsetX {
            offsetX = maxOffsetX
        }
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            let newFrame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
            super.frame = newFrame
        }
    }
}

class TitleLabel: UILabel {
    /// 用来记录当前 label 的缩放比例
    var currentScale: CGFloat = 1.0 {
        didSet {
            transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
        }
    }
}
