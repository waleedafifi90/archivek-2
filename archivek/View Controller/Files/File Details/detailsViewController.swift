//
//  detailsViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 08/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var tableView: GeneralTableView!
    @IBOutlet weak var attachmentTableView: GeneralTableView!
    
    var objects: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
}

extension detailsViewController {
    func setupView() {
        tableView.registerNib(withIdentifier: ["fileDetailsTableViewCell"])
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        tableView.objects.append(GeneralTableViewData(identifier: "fileDetailsTableViewCell", object: objects, height: nil))
    }
}
