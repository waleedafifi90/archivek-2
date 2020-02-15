//
//  folderTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import SwiftyJSON

class folderTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var folderNameUILabel: UILabel!
    @IBOutlet weak var fileCountUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func configureCell() {
        if let obj = FileClass.init(fromJson: self.object?.object as? JSON) {
            folderNameUILabel.text = obj.sName
            fileCountUILabel.text = String(obj.sFilesCount ?? 0)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = CategoryClass.init(fromJson: self.object?.object as? JSON) {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "categoryByIdViewController") as! categoryByIdViewController
            vc.categoryID = obj.pkIId
            vc.categoryName = obj.sValue ?? ""
            parentVC?.show(vc, sender: self)
        }

    }
}
