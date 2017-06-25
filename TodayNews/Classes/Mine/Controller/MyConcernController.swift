//
//  MyConcernController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/6/25.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class MyConcernController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "关注"
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "follow_title_profile_18x18_"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
    }
    
    func rightBarButtonItemClicked() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addFriendVC = storyBoard.instantiateViewController(withIdentifier: String(describing: AddFriendViewController.self)) as! AddFriendViewController
        navigationController?.pushViewController(addFriendVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
