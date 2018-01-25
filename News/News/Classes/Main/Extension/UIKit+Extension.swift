//
//  UIKit+Extension.swift
//  News
//
//  Created by 杨蒙 on 2017/12/12.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import CoreText
import Kingfisher

protocol NibLoadable {}

extension NibLoadable {
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}

protocol RegisterCellFromNib {}

extension RegisterCellFromNib {
    
    static var identifier: String {
        return "\(self)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}

extension SettingCell {
    /// 从沙盒中获取缓存数据的大小
    func calculateDiskCashSize() {
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { (size) in
            // 转换成 M
            let sizeM = Double(size) / 1024.0 / 1024.0
            self.rightTitleLabel.text = String(format: "%.2fM", sizeM)
        }
    }
    /// 非 WiFi 网络播放提醒
    func setupPlayNoticeAlertController() {
        let alertController = UIAlertController(title: "非 WiFi 网络播放提醒", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let everyAction = UIAlertAction(title: "每次提醒", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "每次提醒"
        })
        let onceAction = UIAlertAction(title: "提醒一次", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "提醒一次"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(everyAction)
        alertController.addAction(onceAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    /// 非 WiFi 网络流量
    func setupNetworkAlertController() {
        let alertController = UIAlertController(title: "非 WiFi 网络流量", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let bestAction = UIAlertAction(title: "最小效果(下载大图)", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "最小效果(下载大图)"
        })
        let betterAction = UIAlertAction(title: "较省流量(智能下图)", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "较省流量(智能下图)"
        })
        let leastAction = UIAlertAction(title: "极省流量(智能下图)", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "极省流量(智能下图)"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(bestAction)
        alertController.addAction(betterAction)
        alertController.addAction(leastAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    /// 设置字体大小
    func setupFontAlertController() {
        let alertController = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let smallAction = UIAlertAction(title: "小", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "小"
        })
        let middleAction = UIAlertAction(title: "中", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "中"
        })
        let bigAction = UIAlertAction(title: "大", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "大"
        })
        let largeAction = UIAlertAction(title: "特大", style: .default, handler: { (_) in
            self.rightTitleLabel.text = "特大"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(smallAction)
        alertController.addAction(middleAction)
        alertController.addAction(bigAction)
        alertController.addAction(largeAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    /// 弹出清理缓存的提示框
    func clearCacheAlertController() {
        let alertController = UIAlertController(title: "确定清除所有缓存？问答草稿、离线下载及图片均会被清除", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: { (_) in
            let cache = KingfisherManager.shared.cache
            cache.clearDiskCache()
            cache.clearMemoryCache()
            cache.cleanExpiredDiskCache()
            self.rightTitleLabel.text = "0.00M"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

extension VideoCell {
    /// 视频播放时隐藏 cell 的部分子视图
    func hideSubviews() {
        titleLabel.isHidden = true
        playCountLabel.isHidden = true
        timeLabel.isHidden = true
        vImageView.isHidden = true
        avatarButton.isHidden = true
        nameLable.isHidden = true
        shareStackView.isHidden = false
    }
    
    /// 设置当前 cell 的属性
    func showSubviews() {
        titleLabel.isHidden = false
        playCountLabel.isHidden = false
        timeLabel.isHidden = false
        avatarButton.isHidden = false
        vImageView.isHidden = !video.user_verified
        nameLable.isHidden = false
        shareStackView.isHidden = true
    }
}

extension UILabel {
    
    /// 设置问答的内容
    func setSeparatedLinesFrom(_ attributedString: NSMutableAttributedString, hasImage: Bool) {
        // 通过 CoreText 创建字体
        let ctFont = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
        // 段落样式
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        // 为富文本添加属性
        attributedString.addAttributes([kCTFontAttributeName as NSAttributedStringKey: ctFont, NSAttributedStringKey.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attributedString.length))
        // 通过 CoreText 创建 frameSetter
        let frameSetter = CTFramesetterCreateWithAttributedString(attributedString)
        // 创建路径
        let path = CGMutablePath()
        // 为路径添加一个 frame
        path.addRect(CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT)))
        // 通过 CoreText 创建 frame
        let frame = CTFramesetterCreateFrame(frameSetter, CFRange(location: 0, length: attributedString.length), path, nil)
        // 获取当前 frame 中的每一行的内容
        let lines: NSArray = CTFrameGetLines(frame)
        
        let attributedStrings = NSMutableAttributedString()
        // 遍历
        for (index, line) in lines.enumerated() {
            // 将 line 转成 CTLine
            // 获取每一行的范围
            let lineRange = CTLineGetStringRange(line as! CTLine)
            // 将 lineRange 转成 NSRange
            let range = NSRange(location: lineRange.location, length: lineRange.length)
            // 当前的内容
            let currentAttributedString = NSMutableAttributedString(attributedString: attributedString.attributedSubstring(from: range))
            if hasImage { // 如果有图片，就把第四行替换
                if index == 3 && currentAttributedString.length >= 18 {
                    replaceContent(currentAttributedString)
                }
            } else { // 如果没有图片，就把第六行替换
                if index == 5 && currentAttributedString.length >= 18 {
                    replaceContent(currentAttributedString)
                }
            }
            attributedStrings.append(currentAttributedString)
        }
        attributedText = attributedStrings
    }
    
    /// 替换内容
    private func replaceContent(_ currentAttributedString: NSMutableAttributedString) {
        currentAttributedString.replaceCharacters(in: NSRange(location: currentAttributedString.length - 8, length: 8), with: NSAttributedString(string: "...全文\n", attributes: [.foregroundColor: UIColor.blueFontColor()]))
    }
    
}

extension UITextView {
    
    /// 设置 UITextView 富文本内容
    func setAttributedText(emoji: Emoji) {
        // 如果输入是空表情
        if emoji.isEmpty { return }
        // 如果输入是删除表情
        if emoji.isDelete {
            deleteBackward()
            return
        }
        
        // 创建附件
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: emoji.png)
        // 当前字体的大小
        let currentFont = font!
        // 附件的大小
        attachment.bounds = CGRect(x: 0, y: -4, width: currentFont.lineHeight, height: currentFont.lineHeight)
        // 根据附件，创建富文本
        let attributedImageStr = NSAttributedString(attachment: attachment)
        // 获取当前的光标的位置
        let range = selectedRange
        // 设置富文本
        let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
        mutableAttributedText.replaceCharacters(in: range, with: attributedImageStr)
        attributedText = mutableAttributedText
        // 将字体的大小重置
        font = currentFont
        // 光标 + 1
        selectedRange = NSRange(location: range.location + 1, length: 0)
    }
    
}

extension UIView {
    
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
}

extension UITableView {
    /// 注册 cell 的方法
    func ym_registerCell<T: UITableViewCell>(cell: T.Type) where T: RegisterCellFromNib {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    /// 从缓存池池出队已经存在的 cell
    func ym_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    /// 注册 cell 的方法
    func ym_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: RegisterCellFromNib {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    /// 从缓存池池出队已经存在的 cell
    func ym_dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UIImageView {
    /// 设置图片圆角
    func circleImage() {
        /// 建立上下文
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        /// 获取当前上下文
        let ctx = UIGraphicsGetCurrentContext()
        /// 添加一个圆，并裁剪
        ctx?.addEllipse(in: self.bounds)
        ctx?.clip()
        /// 绘制图像
        self.draw(self.bounds)
        /// 获取绘制的图像
        let image = UIGraphicsGetImageFromCurrentImageContext()
        /// 关闭上下文
        UIGraphicsEndImageContext()
        DispatchQueue.global().async {
            self.image = image
        }
    }
    
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        //        self.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 背景灰色 f8f9f7
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
    
    /// 背景红色
    class func globalRedColor() -> UIColor {
        return UIColor(r: 196, g: 73, b: 67)
    }
    
    /// 字体蓝色
    class func blueFontColor() -> UIColor {
        return UIColor(r: 72, g: 100, b: 149)
    }
    
    /// 背景灰色 132
    class func grayColor132() -> UIColor {
        return UIColor(r: 132, g: 132, b: 132)
    }
    
    /// 背景灰色 232
    class func grayColor232() -> UIColor {
        return UIColor(r: 232, g: 232, b: 232)
    }
    
    /// 夜间字体背景灰色 113
    class func grayColor113() -> UIColor {
        return UIColor(r: 113, g: 113, b: 113)
    }
    
    /// 夜间背景灰色 37
    class func grayColor37() -> UIColor {
        return UIColor(r: 37, g: 37, b: 37)
    }
    
    /// 灰色 210
    class func grayColor210() -> UIColor {
        return UIColor(r: 210, g: 210, b: 210)
    }
    
}

