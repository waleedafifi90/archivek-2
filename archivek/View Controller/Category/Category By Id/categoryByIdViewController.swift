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
    var categoryName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    @IBAction func addNewFileButtonPressed(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "newFileViewController") as! newFileViewController
        vc.categoryId = self.categoryID ?? 0
        vc.categoryName = self.categoryName
        self.show(vc, sender: self)
    }
}

extension categoryByIdViewController {
    func setupView() {
        let parameters = ["i_category_id": categoryID!]
        tableView.registerNib(withIdentifier: ["fileCellTableViewCell", "folderTableViewCell"])
        tableView.cellIdentifier = "fileCellTableViewCell"
        tableView.req = CategoryById().request(withParameters: parameters)
        tableView.load = true
    }
    
    func fetchData() {
//        let parameters = ["i_category_id": categoryID!]
//        let request = CategoryById().request(withParameters: parameters)
//        tableView.withIdentifier(identifier: "folderTableViewCell").withRequest(request: request).buildRequest { (json) -> [Any] in
//            var array: [Any] = []
//            for item in json.array ?? [] {
//                if let obj = FileClass.init(fromJson: item) {
//                    array.append(obj)
//                    debugPrint(array)
//                }
//            }
//            return array
//        }.didFinishRequest {
//        }
    }
}
