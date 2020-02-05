//
//  fileCellTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class fileCellTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var fileNameUILabel: UILabel!
    @IBOutlet weak var fileIconUIImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configureCell() {
        if let obj = Files.init(fromDictionary: self.object?.object as! [String: Any]) {
            fileNameUILabel.text = obj.sName
            fileIconUIImage.kf.setImage(with: URL(string: obj.sFileLogo ?? ""))
        }
    }
    
}
