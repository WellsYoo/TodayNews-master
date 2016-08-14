//
//  YMVideoUserController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/8/14.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMVideoUserController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSizeMake(SCREENW, 1000)
        
        scrollView.addSubview(headerView)
        
    }

    private lazy var headerView: YMUserHeaderView = {
        let headerView = YMUserHeaderView.userHeaderView()
        return headerView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMVideoUserController: UIScrollViewDelegate {
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("\(headerView.backButton)-------")
        print("\(headerView.careButton)-------")
        print(headerView.moreButton)
        print(scrollView.contentOffset.y)
        let offsetY = scrollView.contentOffset.y
        
        if offsetY > -20 {
            headerView.topView.y = 0
            headerView.backButton.centerY = headerView.topView.centerY
            headerView.careButton.centerY = headerView.topView.centerY
            headerView.moreButton.centerY = headerView.topView.centerY
        }
    }
}
