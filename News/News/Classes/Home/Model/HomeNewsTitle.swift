//
//  HomeNewsTitle.swift
//  News
//
//  Created by 杨蒙 on 2017/10/6.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation
import HandyJSON

struct HomeNewsTitle: HandyJSON {
    // news_hot(热点),news_local（地区），video（视频），news_society（社会），组图（图片）
    // news_entertainment（娱乐），news_tech（科技），news_car（汽车），news_finance（财经）
    // news_military（军事），news_sports（体育），essay_joke（段子），image_ppmm（街拍），
    // news_world（国际），image_funny（趣图），news_health（健康），jinritemai（特卖，有链接）
    // news_house（房产），news_fashion（时尚），news_history（历史），news_baby（育儿）
    // funny（搞笑），digital（数码），news_food（美食），news_regimen（养生），
    // movie（电影），cellphone（手机），news_travel（旅游），宠物（宠物），emotion（情感）
    // news_home（家居），news_edu（教育），news_agriculture（三农），pregnancy（孕产），
    // news_culture（文化），news_game（游戏），stock（股票），science_all（科学），news_comic（动漫）
    // news_story（故事），news_collect（收藏），boutique（精选），essay_saying（语录）
    // news_astrology（星座），image_wonderful（美图），rumor（辟谣），positive（正能量）
    var category: NewsTitleCategory = .recommend
    var tip_new: Int = 0
    var default_add: Int = 0
    var web_url: String = ""
    var concern_id: String = ""
    var icon_url: String = ""
    var flags: Int = 0
    var type: Int = 0
    var name: String = ""
    
    var selected: Bool = true
}

/// 新闻标题的分类
enum NewsTitleCategory: String, HandyJSONEnum {
    case recommend = ""                                 // 推荐
    case hot = "news_hot"                               // 热点
    case local = "news_local"                           // 地区
    case video = "video"                                // 视频
    case society = "news_society"                       // 社会
    case photos = "组图"                                 // 图片
    case entertainment = "news_entertainment"           // 娱乐
    case newsTech = "news_tech"                         // 科技
    case car = "news_car"                               // 科技
    case finance = "news_finance"                       // 财经
    case military = "news_military"                     // 军事
    case sports = "news_sports"                         // 体育
    case essayJoke = "essay_joke"                       // 段子
    case imagePPMM = "image_ppmm"                       // 街拍
    case imageFunny = "image_funny"                     // 趣图
    case imageWonderful = "image_wonderful"             // 美图
    case world = "news_world"                           // 国际
    case funny = "funny"                                // 搞笑
    case health = "news_health"                         // 健康
    case jinritemai = "jinritemai"                      // 特卖
    case house = "news_house"                           // 房产
    case fashion = "news_fashion"                       // 时尚
    case history = "news_history"                       // 历史
    case baby = "news_baby"                             // 育儿
    case digital = "digital"                            // 数码
    case essaySaying = "essay_saying"                   // 语录
    case astrology = "news_astrology"                   // 星座
    case rumor = "rumor"                                // 辟谣
    case positive = "positive"                          // 正能量
    case comic = "news_comic"                           // 动漫
    case story = "news_story"                           // 故事
    case collect = "news_collect"                       // 收藏
    case boutique = "boutique"                          // 精选
    case pregnancy = "pregnancy"                        // 孕产
    case culture = "news_culture"                       // 文化
    case game = "news_game"                             // 游戏
    case stock = "stock"                                // 股票
    case science = "science_all"                        // 科学
    case pet = "宠物"                                    // 宠物
    case emotion = "emotion"                            // 情感
    case home = "news_home"                             // 家居
    case education = "news_edu"                         // 教育
    case agriculture = "news_agriculture"               // 三农
    case food = "news_food"                             // 美食
    case regimen = "news_regimen"                       // 养生
    case movie = "movie"                                // 电影
    case cellphone = "cellphone"                        // 手机
    case travel = "news_travel"                         // 旅行
}
