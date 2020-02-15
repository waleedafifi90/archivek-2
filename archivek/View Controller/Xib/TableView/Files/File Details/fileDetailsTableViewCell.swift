//
//  fileDetailsTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 05/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class fileDetailsTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var subTitleUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configureCell() {
//        if let obj = Files.init(fromDictionary: self.object?.object as! [String: Any]) {
            titleUILabel.text = "test"
//        }
    }
}
