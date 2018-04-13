//
//  HomeAddCategoryController.swift
//  TodayNews
//
//  Created by 杨蒙 on 2018/2/3.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeAddCategoryController: AnimatableModalViewController, StoryboardLoadable {
    /// 是否编辑
    var isEdit = false
    // 上部 我的频道
    private var homeTitles = [HomeNewsTitle]()
    // 下部 频道推荐数据
    private var categories = [HomeNewsTitle]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 从数据库中取出左右数据，赋值给 标题数组 titles
        homeTitles = NewsTitleTable().selectAll()
        // 布局
        collectionView.collectionViewLayout = AddCategoryFlowLayout()
        // 注册 cell 和头部
        collectionView.ym_registerCell(cell: AddCategoryCell.self)
        collectionView.ym_registerCell(cell: ChannelRecommendCell.self)
        collectionView.ym_registerSupplementaryHeaderView(reusableView: ChannelRecommendReusableView.self)
        collectionView.ym_registerSupplementaryHeaderView(reusableView: MyChannelReusableView.self)
        collectionView.allowsMultipleSelection = true
        collectionView.addGestureRecognizer(longPressRecognizer)
        // 点击首页加号按钮，获取频道推荐数据
        NetworkTool.loadHomeCategoryRecommend {
            self.categories = $0
            self.collectionView.reloadData()
        }
    }
    
    /// 长按手势
    private lazy var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressTarget))
    
    @objc private func longPressTarget(longPress: UILongPressGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "longPressTarget"), object: nil)
        let selectedIndexPath = collectionView.indexPathForItem(at: longPress.location(in: collectionView))
        if selectedIndexPath?.item != 0 && selectedIndexPath?.item != 1 {
            switch longPress.state {
            case .began:
                if isEdit && selectedIndexPath?.section == 0 { // 选中的是上部的 cell,并且是可编辑状态
                    collectionView.beginInteractiveMovementForItem(at: selectedIndexPath!)
                } else {
                    isEdit = true
                    collectionView.reloadData()
                    if (selectedIndexPath != nil) && (selectedIndexPath?.section == 0) {
                        collectionView.beginInteractiveMovementForItem(at: selectedIndexPath!)
                    }
                }
            case .changed:
                collectionView.updateInteractiveMovementTargetPosition(longPress.location(in: longPressRecognizer.view))
            case .ended:
                collectionView.endInteractiveMovement()
            default:
                collectionView.cancelInteractiveMovement()
            }
        }
    }
    
    /// 关闭按钮
    @IBAction func closeAddCategoryButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - MyChannelReusableViewDelegate
extension HomeAddCategoryController: AddCategoryCellDelagate {
    /// 删除按钮点击
    func deleteCategoryButtonClicked(of cell: AddCategoryCell) {
        // 上部删除，下部添加
        let indexPath = collectionView.indexPath(for: cell)
        categories.insert(homeTitles[indexPath!.item], at: 0)
        collectionView.insertItems(at: [IndexPath(item: 0, section: 1)])
        homeTitles.remove(at: indexPath!.item)
        collectionView.deleteItems(at: [IndexPath(item: indexPath!.item, section: 0)])
    }

}

extension HomeAddCategoryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// 头部
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let channelResableView = collectionView.ym_dequeueReusableSupplementaryHeaderView(indexPath: indexPath) as MyChannelReusableView
            // 点击了编辑 / 完成 按钮
            channelResableView.channelReusableViewEditButtonClicked = { [weak self] (sender) in
                self!.isEdit = sender.isSelected
                self!.collectionView.reloadData()
            }
            return channelResableView
        } else {
            return collectionView.ym_dequeueReusableSupplementaryHeaderView(indexPath: indexPath) as ChannelRecommendReusableView
        }
    }
    
    /// headerView 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 50)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? homeTitles.count : categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.ym_dequeueReusableCell(indexPath: indexPath) as AddCategoryCell
            cell.titleButton.setTitle(homeTitles[indexPath.item].name, for: .normal)
            cell.isEdit = isEdit
            cell.delegate = self
            return cell
        } else {
            let cell = collectionView.ym_dequeueReusableCell(indexPath: indexPath) as ChannelRecommendCell
            cell.titleButton.setTitle(categories[indexPath.item].name, for: .normal)
            return cell
        }
    }
    
    /// 点击了某一个 cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 点击上面一组，不做任何操作，点击下面一组的cell 会添加到上面的组里
        guard indexPath.section == 1 else { return }
        homeTitles.append(categories[indexPath.item]) // 添加
        collectionView.insertItems(at: [IndexPath(item: homeTitles.count - 1, section: 0)])
        categories.remove(at: indexPath.item)
        collectionView.deleteItems(at: [IndexPath(item: indexPath.item, section: 1)])
    }
    /// 移动 cell
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard isEdit && sourceIndexPath.section == 0 else { return }
        // 需要移动的 cell
        let title = homeTitles[sourceIndexPath.item]
        homeTitles.remove(at: sourceIndexPath.item)
        homeTitles.insert(title, at: destinationIndexPath.item)
    }
    /// 每个 cell 之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}

/// 布局
class AddCategoryFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        // 每个 cell 的大小
        itemSize = CGSize(width: (screenWidth - 50) * 0.25, height: 44)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }
}
