//
//  WNTabBarController.swift
//  WellsNews
//
//  Created by Wells on 2018/10/29.
//  Copyright © 2018 Wells. All rights reserved.
//

import UIKit
import SwiftTheme

class WNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        
        addChildViewControllers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked(notification:)), name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
  
    }
    
    /// 接收到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        
    }
    
// MARK: Private
    private func addChildViewControllers() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home")
    }
    
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        
        addChild(childController)
    }
    
    /// 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
