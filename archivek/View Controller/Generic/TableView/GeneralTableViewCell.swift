//
//  GeneralTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

protocol GeneralTableViewCellDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
}

class GeneralTableViewCell: UITableViewCell, GeneralTableViewCellDelegate {
    var cellDelegate: GeneralTableViewCellDelegate!
    var object: GeneralTableViewData?
    var parentVC: UIViewController?
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellDelegate = self
    }
    
    func configureCell() { }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) { }
}
