//
//  HomeTitleView.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/7/5.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

protocol HomeTitleViewDelegate : class {
    func titleView(_ titleView : HomeTitleView, targetIndex : Int)
}

class HomeTitleView: UIView {

    weak var delegate : HomeTitleViewDelegate?
    
    fileprivate var titles : [HomeTopTitle]
    fileprivate var style : TitleStyle
    
    fileprivate lazy var currentIndex : Int = 0
    
    init(frame: CGRect, titles : [HomeTopTitle], style : TitleStyle) {
        self.titles = titles
        self.style = style
        
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 标题数组
    fileprivate lazy var titleLabels : [HomeTitleLabel] = [HomeTitleLabel]()
    /// 滚动视图
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.width - self.style.titleHeight, height: self.height))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    /// 底部滚动指示器
    fileprivate lazy var bottomLine : UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = self.style.scrollLineColor
        bottomLine.frame.size.height = self.style.scrollLineHeight
        bottomLine.frame.origin.y = self.height - self.style.scrollLineHeight - 1
        return bottomLine
    }()
    
    // 懒加载 右侧按钮
    fileprivate lazy var rightButton: UIButton = {
        let rightButton = UIButton(frame: CGRect(x: self.width - self.style.titleHeight, y: 0, width: self.style.titleHeight, height: self.style.titleHeight))
        rightButton.setImage(UIImage(named: "add_channel_titlbar_thin_new_16x16_"), for: .normal)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return rightButton
    }()
    /// 底部分割线
    fileprivate lazy var bottomLineView: UIView = {
        let bottomLineView = UIView(frame: CGRect(x: 0, y: self.style.titleHeight - 1, width: self.width, height: 1))
        bottomLineView.backgroundColor = UIColor.globalBackgroundColor()
        return bottomLineView
    }()

}

extension HomeTitleView {
    func setupUI() {
        // 将UIScrollVIew添加到view中
        addSubview(scrollView)
        addSubview(rightButton)
        addSubview(bottomLineView)
        // 将titleLabel添加到UIScrollView中
        setupTitleLabels()
        // 设置titleLabel的frame
        setupTitleLabelsFrame()
        // 添加滚动条
        scrollView.addSubview(bottomLine)
    }
    
    /// 将titleLabel添加到UIScrollView中
    private func setupTitleLabels() {
        for (index, topTitle) in titles.enumerated() {
            let titleLabel = HomeTitleLabel()
            titleLabel.text = topTitle.name
            titleLabel.font = UIFont.systemFont(ofSize: style.fontSize)
            titleLabel.tag = index
            titleLabel.textAlignment = .center
            titleLabel.textColor = index == 0 ? style.selectColor : style.normalColor
            
            scrollView.addSubview(titleLabel)
            titleLabels.append(titleLabel)
            
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
            titleLabel.addGestureRecognizer(tapGes)
            titleLabel.isUserInteractionEnabled = true
        }
    }
    
    private func setupTitleLabelsFrame() {
        
        for (i, label) in titleLabels.enumerated() {
            var w : CGFloat = 0
            let h : CGFloat = bounds.height
            var x : CGFloat = 0
            let y : CGFloat = 0
            
            let topTitle = titles[i]
            
            w = (topTitle.name! as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height:0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : label.font], context: nil).width
            if i == 0 {
                x = style.itemMargin * 0.5
                bottomLine.frame.origin.x = x
                bottomLine.frame.size.width = w
            } else {
                let preLabel = titleLabels[i - 1]
                x = preLabel.frame.maxX + style.itemMargin
            }
            label.frame = CGRect(x: x, y: y, width: w, height: h)
        }
        scrollView.contentSize = CGSize(width: titleLabels.last!.frame.maxX + style.itemMargin * 0.5, height: 0)
    }
    
}

// MARK:- 监听事件
extension HomeTitleView {
    @objc fileprivate func titleLabelClick(_ tapGes : UITapGestureRecognizer) {
        // 取出用户点击的View
        let targetLabel = tapGes.view as! UILabel
        
        // 调整title
        adjustTitleLabel(targetIndex: targetLabel.tag)
        
        // 调整bottomLine
        UIView.animate(withDuration: 0.25, animations: {
            self.bottomLine.frame.origin.x = targetLabel.frame.origin.x
            self.bottomLine.frame.size.width = targetLabel.frame.width
        })
        
        // 通知代理
        delegate?.titleView(self, targetIndex: currentIndex)
    }
    
    fileprivate func adjustTitleLabel(targetIndex : Int) {
        
        if targetIndex == currentIndex { return }
        
        // 1.取出Label
        let targetLabel = titleLabels[targetIndex]
        let sourceLabel = titleLabels[currentIndex]
        
        // 2.切换文字的颜色
        targetLabel.textColor = style.selectColor
        sourceLabel.textColor = style.normalColor
        
        // 3.记录下标值
        currentIndex = targetIndex
        
        // 4.调整位置
        var offsetX = targetLabel.center.x - scrollView.bounds.width * 0.5
        if offsetX < 0 {
            offsetX = 0
        }
        if offsetX > (scrollView.contentSize.width - scrollView.bounds.width) {
            offsetX = scrollView.contentSize.width - scrollView.bounds.width
        }
        scrollView.setContentOffset(CGPoint(x: offsetX, y : 0), animated: true)
    }
    
    /// 右侧按钮点击
    @objc fileprivate func rightButtonClicked() {
        
    }
}

private class HomeTitleLabel: UILabel {
    /// 用来记录当前 label 的缩放比例
    var currentScale: CGFloat = 1.0 {
        didSet {
            transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
        }
    }
}
