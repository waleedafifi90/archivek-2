//
//  fileCellTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import SwiftyJSON
import WebKit

class fileCellTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var fileNameUILabel: UILabel!
    @IBOutlet weak var fileIconUIImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configureCell() {
        if let obj = FileClass.init(fromJson: self.object?.object as? JSON) {
            fileNameUILabel.text = obj.sName
            fileIconUIImage.kf.setImage(with: URL(string: obj.sFileLogo ?? ""))
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = FileClass.init(fromJson: self.object?.object as? JSON) {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "fileDetailsViewController") as! fileDetailsViewController
            vc.object = obj
            self.parentVC?.show(vc, sender: self)
        }
    }
    
}
