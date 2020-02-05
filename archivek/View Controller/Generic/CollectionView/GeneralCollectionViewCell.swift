//
//  GeneralCollectionViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

protocol GeneralCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
}

class GeneralCollectionViewCell: UICollectionViewCell ,GeneralCollectionViewCellDelegate {
    var cellDelegate: GeneralCollectionViewCellDelegate!
    var object: GeneralCollectionViewData?
    var parentVC: UIViewController?
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellDelegate = self
    }
    
    func configuerCell() { }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) { }
}
