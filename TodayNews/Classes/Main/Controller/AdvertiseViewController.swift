//
//  AdvertiseViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/26.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class AdvertiseViewController: UIViewController {
    /// 延迟 2 秒
    private var time: TimeInterval = 2.0
    
    private var countdownTimer: Timer?
    
    @IBOutlet weak var timeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let tabBarVC = sb.instantiateViewController(withIdentifier: String(describing: MyTabBarController.self))
            UIApplication.shared.keyWindow?.rootViewController = tabBarVC
        }
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        time -= 1
        timeButton.setTitle(String(format: "%.0f s 跳过", time), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func timeButtonClicked(_ sender: Any) {
        
    }
}
