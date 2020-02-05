//
//  folderTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class folderTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var folderNameUILabel: UILabel!
    @IBOutlet weak var fileCountUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func configureCell() {
        if let obj = Files.init(fromDictionary: self.object?.object as! [String: Any]) {
            folderNameUILabel.text = obj.sName
            fileCountUILabel.text = String(obj.sFilesCount ?? 0)
        }
    }
}
