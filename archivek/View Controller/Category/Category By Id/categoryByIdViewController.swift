//
//  categoryByIdViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class categoryByIdViewController: UIViewController {
    
    @IBOutlet weak var tableView: GeneralTableView!
    var categoryID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @IBAction func addNewFileButtonPressed(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "newFileViewController") as! newFileViewController
        vc.categoryId = self.categoryID ?? 0
        self.show(vc, sender: self)
    }
}

extension categoryByIdViewController {
    func setupView() {
        let parameters = ["i_category_id": categoryID!]
        tableView.registerNib(withIdentifier: ["fileCellTableViewCell", "folderTableViewCell"])
        tableView.cellIdentifier = "folderTableViewCell"
        tableView.req = CategoryById().request(withParameters: parameters)
        tableView.load = true
    }
}
