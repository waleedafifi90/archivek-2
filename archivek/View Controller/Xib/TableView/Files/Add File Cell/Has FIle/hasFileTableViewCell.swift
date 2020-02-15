//
//  hasFileTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class hasFileTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var filenameUILabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? String {
            filenameUILabel.text = obj
        }
    }
    
    @IBAction func removeFileButtonPressed(_ sender: Any) {
    }
}
