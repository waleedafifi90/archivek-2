//
//  homeCategoriesCollectionViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import Kingfisher

class homeCategoriesCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var categoryUIImageView: UIImageView!
    @IBOutlet weak var categoryUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configuerCell() {
        if let obj = Category.init(fromDictionary: self.object?.object as! [String : Any]) {
            self.categoryUIImageView.kf.setImage(with: URL(string: obj.sImage ?? ""))
            self.categoryUILabel.text = obj.sValue
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let obj = Category.init(fromDictionary: self.object?.object as! [String : Any]) {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "categoryByIdViewController") as! categoryByIdViewController
            vc.categoryID = obj.pkIId
            parentVC?.show(vc, sender: self)
        }
    }
}
