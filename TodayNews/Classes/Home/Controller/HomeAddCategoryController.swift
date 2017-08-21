//
//  HomeAddCategoryController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2017/8/6.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeAddCategoryController: AnimatableModalViewController {
    /// 是否编辑
    var isEdit = false
    // 上部 我的频道
    var homeTitles = [TopicTitle]()
    // 下部 频道推荐数据
    var categories = [TopicTitle]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        // 每个 cell 的大小
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

// MARK: - MyChannelReusableViewDelegate
extension HomeAddCategoryController: MyChannelReusableViewDelegate {
    /// 编辑按钮点击
    func channelReusableViewEditButtonClicked(_ sender: UIButton) {
        isEdit = sender.isSelected
        collectionView.reloadData()
    }
}

extension HomeAddCategoryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// 头部
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let myChannelReuseableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: MyChannelReusableView.self), for: indexPath) as! MyChannelReusableView
            myChannelReuseableView.delegate = self
            return myChannelReuseableView
        } else if indexPath.section == 1 {
            let channelreuseableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: ChannelRecommendReusableView.self), for: indexPath) as! ChannelRecommendReusableView
            return channelreuseableView
        }
        return UICollectionReusableView()
    }
    
    
    /// headerView 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 50)
    }
    /// cell 的组数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    /// 每组 cell 的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return homeTitles.count
        } else if section == 1 {
            return categories.count
        }
        return 0
    }
    /// cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  String(describing: AddCategoryCell.self), for: indexPath) as! AddCategoryCell
        if indexPath.section == 0 {
            let category = homeTitles[indexPath.item]
            cell.isEdit = isEdit
            cell.titleButton.setTitle(category.name!, for: .normal)
        } else if indexPath.section == 1 {
            let category = categories[indexPath.item]
            cell.isEdit = false
            cell.titleButton.setTitle(category.name!, for: .normal)
        }
        return cell
    }
    /// 点击了某一个 cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
        }
        
    }
    /// 移动 cell
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard !isEdit || sourceIndexPath.section == 1 else {
            return
        }
        /// 需要移动的 cell
        
//        collectionView.reloadData()
    }
    
    /// 每个 cell 之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0{
            dismiss(animated: true, completion: nil)
        }
    }
}
