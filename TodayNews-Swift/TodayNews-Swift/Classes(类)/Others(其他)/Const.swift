//
//  Const.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/8.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

/// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
/// 可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
/// 替换成自己的，再进行测试
let IID: String = "5034850950"
let device_id: String = "6096495334"
let version_code = "5.9.8"

/// 服务器地址
let BASE_URL = "http://lf.snssdk.com/"
// 左右间距
let kMargin:CGFloat = 15.0
// 导航栏高度
let kNavBarHeight: CGFloat = 64.0
// 导航栏高度
let kTabBarHeight: CGFloat = 49.0
/// 首页新闻间距
let khomePageTitleHeight: CGFloat = 40.0
/// 首页新闻间距
let kHomeMargin: CGFloat = 15.0
/// 微头条界面 头部视图 的高度
let kWeiTouTiaoHeaderHieght: CGFloat = 45
/// 我的界面 头部视图 的高度
let kMineHeaderViewHieght: CGFloat = 218

/// 屏幕的宽
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let screenHeight = UIScreen.main.bounds.height

/// iPhone 5
let isIPhone5 = screenHeight == 568 ? true : false
/// iPhone 6
let isIPhone6 = screenHeight == 667 ? true : false
/// iPhone 6P
let isIPhone6P = screenHeight == 736 ? true : false
