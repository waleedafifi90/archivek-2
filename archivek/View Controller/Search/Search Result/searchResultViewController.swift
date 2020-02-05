//
//  searchResultViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class searchResultViewController: UIViewController {

    @IBOutlet weak var tableView: GeneralTableView!
    
    var params: [String: Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension searchResultViewController {
    func setupView() {
        let request = SearchRequest().request(withParameters: params)
        tableView.cellIdentifier = "fileCellTableViewCell"
        tableView.registerNib(withIdentifier: ["fileCellTableViewCell", "folderTableViewCell"])
        tableView.req = request
        tableView.loadTable()
    }
}
