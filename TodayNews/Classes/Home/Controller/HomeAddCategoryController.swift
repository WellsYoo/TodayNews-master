//
//  HomeAddCategoryController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/6.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import IBAnimatable
import RxSwift
import RxCocoa

class HomeAddCategoryController: AnimatableModalViewController {
    
    fileprivate let disposeBag = DisposeBag()
    // 我的频道
    var homeTitles = [TopicTitle]()
    // 频道推荐数据
    var categories = [TopicTitle]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (screenWidth - 50) * 0.25, height: 40)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        // 注册 cell 和头部
        collectionView.register(UINib(nibName: String(describing: AddCategoryCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: AddCategoryCell.self))
        collectionView.register(UINib(nibName: String(describing: MyChannelReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: MyChannelReusableView.self))
        collectionView.register(UINib(nibName: String(describing: ChannelRecommendReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: ChannelRecommendReusableView.self))
        collectionView.allowsMultipleSelection = true
        collectionView.delegate = self
        collectionView.dataSource = self
        // 点击首页加号按钮，获取频道推荐数据
        NetworkTool.loadHomeCategoryRecommend { (categories) in
            self.categories = categories
            self.collectionView.reloadData()
        }
    }
    
    /// 关闭按钮
    @IBAction func closeAddCategoryButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension HomeAddCategoryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let myChannelReuseableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: MyChannelReusableView.self), for: indexPath) as! MyChannelReusableView
            myChannelReuseableView.editChannelButton.rx.controlEvent(.touchUpInside)
                .subscribe(onNext: {   // 编辑/完成
                    
                })
                .addDisposableTo(disposeBag)
            return myChannelReuseableView
        } else if indexPath.section == 1 {
            let channelreuseableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: ChannelRecommendReusableView.self), for: indexPath) as! ChannelRecommendReusableView
            return channelreuseableView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 50)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return homeTitles.count
        } else if section == 1 {
            return categories.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  String(describing: AddCategoryCell.self), for: indexPath) as! AddCategoryCell
        if indexPath.section == 0 {
            let category = homeTitles[indexPath.item]
            cell.titleButton.setTitle(category.name!, for: .normal)
        } else if indexPath.section == 1 {
            let category = categories[indexPath.item]
            cell.titleButton.setTitle(category.name!, for: .normal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0{
            dismiss(animated: true, completion: nil)
        }
    }
}
