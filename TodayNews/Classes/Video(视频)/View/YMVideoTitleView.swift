//
//  YMTitleView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/1.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMVideoTitleView: UIView {
    /// 顶部标题数组
    var titles = [YMVideoTopTitle]()
    /// 存放标题 label 数组
    var labels = [YMTitleLabel]()
    /// 存放 label 的宽度
    var labelWidths = [CGFloat]()
    /// 顶部导航栏右边加号按钮点击
    var searchBtnClickClosure: (() -> ())?
    /// 点击了一个 label
    var didSelectVideoTitleLable: ((titleLabel: YMTitleLabel)->())?
    /// 向外界传递 titles 数组
    var videoTitlesClosure: ((titleArray: [YMVideoTopTitle])->())?
    /// 记录当前选中的下标
    private var currentIndex = 0
    /// 记录上一个下标
    private var oldIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// 获取数据
        YMNetworkTool.shareNetworkTool.loadVideoTitlesData({ [weak self] (topTitles) in
            self!.titles = topTitles
            self!.setupUI()
        })
    }
    
    private func setupUI() {
        // 添加滚动视图
        addSubview(scrollView)
        // 添加搜索按钮
        addSubview(titleSearchButton)

        scrollView.snp_makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.right.equalTo(titleSearchButton.snp_left)
        }
        
        titleSearchButton.snp_makeConstraints { (make) in
            make.top.bottom.right.equalTo(self)
            make.width.equalTo(30)
        }
        
        /// 添加 label
        setupVideoTitlesLable()
        /// 设置 label 的位置
        setupVideoLabelsPosition()
        
        videoTitlesClosure?(titleArray: titles)
    }
    
    /// 暴露给外界，告知外界点击了哪一个 titleLabel
    func didSelectVideoTitleLableClosure(closure:(titleLabel: YMTitleLabel)->()) {
        didSelectVideoTitleLable = closure
    }
    
    /// 暴露给外界，向外界传递 topic 数组
    func videoTitleArrayClosure(closure: (titleArray: [YMVideoTopTitle])->()) {
        videoTitlesClosure = closure
    }
    
    /// 顶部搜索按钮
    private lazy var titleSearchButton: UIButton = {
        let titleSearchButton = UIButton()
        titleSearchButton.addTarget(self, action: #selector(titleSearchButtonClick(_:)), forControlEvents: .TouchUpInside)
        titleSearchButton.setImage(UIImage(named: "search_topic_24x24_"), forState: .Normal)
        return titleSearchButton
    }()
    
    func titleSearchButtonClick(button: UIButton) {
        searchBtnClickClosure?()
    }
    
    /// 添加按钮闭包
    func searchButtonClickClosure(closure:()->()) {
        searchBtnClickClosure = closure
    }
    
    /// 设置滚动视图
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension YMVideoTitleView {
    
    /// 添加 label
    private func setupVideoTitlesLable() {
        for (index, topic) in titles.enumerate() {
            let label = YMTitleLabel()
            label.text = topic.name
            label.tag = index
            label.textColor = UIColor.blackColor()
            label.textAlignment = .Center
            label.userInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelOnClick(_:)))
            label.addGestureRecognizer(tap)
            label.font = UIFont.systemFontOfSize(17)
            label.sizeToFit()
            label.width += kMargin
            labels.append(label)
            labelWidths.append(label.width)
            scrollView.addSubview(label)
        }
        let currentLabel = labels[currentIndex]
        currentLabel.textColor = YMColor(232, g: 84, b: 85, a: 1.0)
        currentLabel.currentScale = 1.1
    }
    
    /// 设置 label 的位置
    private func setupVideoLabelsPosition() {
        var titleX: CGFloat = 0.0
        let titleY: CGFloat = 0.0
        var titleW: CGFloat = 0.0
        let titleH = self.height
        
        for (index, label) in labels.enumerate() {
            titleW = labelWidths[index]
            titleX = kMargin
            if index != 0 {
                let lastLabel = labels[index - 1]
                titleX = CGRectGetMaxX(lastLabel.frame) + kMargin
            }
            label.frame = CGRectMake(titleX, titleY, titleW, titleH)
        }
        /// 设置 contentSize
        if let lastLabel = labels.last {
            scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame), 0)
        }
    }
    
    /// 标题点击的方法
    func titleLabelOnClick(tap: UITapGestureRecognizer) {
        guard let  currentLabel = tap.view as? YMTitleLabel else {
            return
        }
        
        oldIndex = currentIndex
        currentIndex = currentLabel.tag
        let oldLabel = labels[oldIndex]
        oldLabel.textColor = UIColor.blackColor()
        oldLabel.currentScale = 1.0
        currentLabel.textColor = YMColor(232, g: 84, b: 85, a: 1.0)
        currentLabel.currentScale = 1.1
        
        // 改变 label 的位置
        adjustVideoTitleOffSetToCurrentIndex(currentIndex, oldIndex: oldIndex)
        // 获取点击的 titleLabel
        didSelectVideoTitleLable?(titleLabel: currentLabel)
    }
    
    /// 当点击标题的时候，检查是否需要改变 label 的位置
    func adjustVideoTitleOffSetToCurrentIndex(currentIndex: Int, oldIndex: Int) {
        if oldIndex == currentIndex {
            return
        }
        // 重新设置 label 的状态
        let currentLabel = labels[currentIndex]
        let oldLabel = labels[oldIndex]
        currentLabel.currentScale = 1.1
        currentLabel.textColor = YMColor(232, g: 84, b: 85, a: 1.0)
        oldLabel.textColor = UIColor.blackColor()
        oldLabel.currentScale = 1.0
        // 当前偏移量
        var offsetX = currentLabel.centerX - SCREENW * 0.5
        if offsetX < 0 {
            offsetX = 0
        }
        // 最大偏移量
        var maxOffsetX = scrollView.contentSize.width - (SCREENW - titleSearchButton.width)
        
        if maxOffsetX < 0 {
            maxOffsetX = 0
        }
        
        if offsetX > maxOffsetX {
            offsetX = maxOffsetX
        }
        scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
    }
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            let newFrame = CGRectMake(0, 0, SCREENW, 44)
            super.frame = newFrame
        }
    }
}
