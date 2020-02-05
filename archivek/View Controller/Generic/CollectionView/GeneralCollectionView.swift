//
//  GeneralCollectionView.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class GeneralCollectionView: UICollectionView {
    var objects: [GeneralCollectionViewData] = []
    var req: BaseRequest = BaseRequest()
    var pageNumber: Int = 1
    var totalPageNumber: Int = 1
    let refControll = UIRefreshControl()
    var cellIdentifier: String = ""
    var cellSize: CGSize?
    
    
    var isSelfSize: Bool = false {
        didSet {
            DispatchQueue.main.async {
                if self.isSelfSize {
                    if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
                        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    
    func registerNib(withIdentifier identifire: [String]) {
        for id in identifire {
            self.register(UINib.init(nibName: id, bundle: nil), forCellWithReuseIdentifier: id)
        }
    }
    
    func loadCollection() {
        RequestBuilder.requestWithSuccessFullResponse(request: req) { (json) in
            for item in json[self.req.responseName].arrayObject! {
                self.objects.append(GeneralCollectionViewData(identifier: self.cellIdentifier, object: item, cellSize: self.cellSize))
            }
            self.reloadData()
//            self.refreshControl?.endRefreshing()
        }
    }
}

extension GeneralCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! GeneralCollectionViewCell
        cell.cellDelegate.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cl = cell as? GeneralCollectionViewCell
        cl?.cellDelegate.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
    }
}

extension GeneralCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let obj = self.objects[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: obj.identifier, for: indexPath) as! GeneralCollectionViewCell
        cell.object = obj
        cell.indexPath = indexPath
        cell.parentVC = self.parentViewController
        cell.configuerCell()
        return cell
    }
}

extension GeneralCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let obj = self.objects[indexPath.row]
        return obj.cellSize ?? CGSize(width: 1, height: 1)
    }
}
