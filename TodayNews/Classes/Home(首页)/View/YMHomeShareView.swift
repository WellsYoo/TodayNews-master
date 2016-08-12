//
//  YMHomeShareView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  分享界面
//

import UIKit

class YMHomeShareView: UIView {

    var shares = [YMHomeShare]()
    
    class func show() {
        let homeShareView = YMHomeShareView()
        homeShareView.frame = UIScreen.mainScreen().bounds
        homeShareView.backgroundColor = YMColor(0, g: 0, b: 0, a: 0.5)
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(homeShareView)
        UIView.animateWithDuration(kAnimationDuration) { 
            homeShareView.bgView.frame = CGRectMake(0, SCREENH - 290, SCREENW, 290)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let path = NSBundle.mainBundle().pathForResource("YMSharePlist", ofType: ".plist")
        let shareArray = NSArray(contentsOfFile: path!)
        for item in shareArray! {
            let share = YMHomeShare(dict: item as! [String : AnyObject])
            shares.append(share)
        }
        
        setupUI()
    }
    
    func setupUI() {
        bgView.frame = CGRectMake(0, SCREENH, SCREENW, 290)
        addSubview(bgView)
        topScrollView.frame = CGRectMake(0, 0, SCREENW, 126)
        bgView.addSubview(topScrollView)
        lineView.frame = CGRectMake(22, CGRectGetMaxY(topScrollView.frame), SCREENW - 44, 1)
        bgView.addSubview(lineView)
        bottomScrollView.frame = CGRectMake(0, CGRectGetMaxY(lineView.frame), SCREENW, 166)
        bgView.addSubview(bottomScrollView)
        
        cancelButton.frame = CGRectMake(0, bgView.height - 48, SCREENW, 48)
        bgView.addSubview(cancelButton)
        
        addButton(topScrollView)
        addButton(bottomScrollView)
    }
    
    // 上部的滚动视图
    private lazy var topScrollView: UIScrollView = {
        let topScrollView = UIScrollView()
        topScrollView.showsHorizontalScrollIndicator = false
        return topScrollView
    }()
    
    // 下部的滚动视图
    private lazy var bottomScrollView: UIScrollView = {
        let bottomScrollView = UIScrollView()
        bottomScrollView.showsHorizontalScrollIndicator = false
        return bottomScrollView
    }()
    
    /// 取消按钮
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", forState: .Normal)
        cancelButton.layer.borderColor = YMColor(220, g: 220, b: 220, a: 1.0).CGColor
        cancelButton.layer.borderWidth = klineWidth
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        cancelButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), forControlEvents: .TouchUpInside)
        return cancelButton
    }()
    
    // 白色背景
    private lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = YMColor(240, g: 240, b: 240, a: 1.0)
        return bgView
    }()
    
    /// 分割线
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = YMColor(220, g: 220, b: 220, a: 1.0)
        return lineView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension YMHomeShareView {
    
    /// 点击了某个分享按钮
    func shareButtonClick(button: YMShareVerticalButton) {
        
    }
    
    /// 创建分享按钮
    func addButton(scrollView: UIScrollView) {
        let buttonW: CGFloat = 80
        let buttonH: CGFloat = 80
        let buttonY: CGFloat = 23
        
        for index in 0..<shares.count {
            let share = shares[index]
            let button = YMShareVerticalButton()
            button.tag = index
            button.setImage(UIImage(named: "\(share.icon!)"), forState: .Normal)
            button.setTitle(share.title, forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(13)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.addTarget(self, action: #selector(shareButtonClick(_:)), forControlEvents: .TouchUpInside)
            let buttonX = CGFloat(index) * buttonW + kMargin
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)
            scrollView.addSubview(button)
            if index == shares.count - 1 {
                scrollView.contentSize = CGSizeMake(CGRectGetMaxX(button.frame) + 2 * kMargin, topScrollView.height)
            }
        }
        scrollView.setContentOffset(CGPointMake(-20, 0), animated: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(kAnimationDuration, animations: { 
            self.bgView.frame = CGRectMake(0, SCREENH, SCREENW, 290)
            }) { (_) in
                self.removeFromSuperview()
        }
    }
    
    /// 取消按钮点击
    func cancelButtonClick() {
        UIView.animateWithDuration(kAnimationDuration, animations: {
            self.bgView.frame = CGRectMake(0, SCREENH, SCREENW, 290)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}
