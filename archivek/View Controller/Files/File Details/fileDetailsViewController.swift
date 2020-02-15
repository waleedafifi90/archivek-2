//
//  fileDetailsViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import WebKit

class fileDetailsViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var tableView: GeneralTableView!
    @IBOutlet weak var filenameUILabel: UILabel!
    @IBOutlet weak var fileNumberUILabel: UILabel!
    @IBOutlet weak var fileExtensionUILabel: UILabel!
    @IBOutlet weak var fileTypeUILabel: UILabel!
    @IBOutlet weak var projectUILabel: UILabel!
    @IBOutlet weak var fileDescriptionUILabel: UILabel!
    @IBOutlet weak var fileStatusUILabel: UILabel!
    @IBOutlet weak var privacyUILabel: UILabel!
    @IBOutlet weak var fileCountUILabel: UILabel!
    @IBOutlet weak var urlFileNameUILabel: UILabel!
    @IBOutlet weak var fileSizeUILabel: UILabel!
    @IBOutlet weak var fileIconUIImage: UIImageView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var attachmentObject: [String]? = []
    var object: FileClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
        setupData()
    }
    
    @IBAction func fileDeleteButtonPressed(_ sender: Any) {
    }
    
    @IBAction func openFile(_ sender: Any) {
        
        let webView = WKWebView()
        webView.navigationDelegate = self
        view = webView

        let url: URL! = URL(string: object?.sFile ?? "")

        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

        
//        webView.loadRequest(URLRequest(url: url))
    }
    
}

extension fileDetailsViewController {
    func setupView() {
        filenameUILabel.text = object?.sName
        fileNumberUILabel.text = object?.sFileNumber
        fileExtensionUILabel.text = object?.sExtensionName
        fileTypeUILabel.text = object?.sType
        projectUILabel.text = object?.sProjectName
        fileDescriptionUILabel.text = object?.sDescription
        fileStatusUILabel.text = (object?.bEnabled == false ? "غير فعال" : "فعال")
        privacyUILabel.text = (object?.bSecret == false ? "عام" : "سري")
        urlFileNameUILabel.text = object?.sName
        fileIconUIImage.kf.setImage(with: URL(string: object?.sFileLogo ?? "default"))
        fileCountUILabel.text = "الملفات المرفقة \(object?.sAttachments?.count ?? 0)"
        tableView.registerNib(withIdentifier: ["attachmentTableViewCell"])
    }
    
    func fetchData() {
        if object?.sAttachments?.count ?? 0 > 0 {
            for attach in object?.sAttachments ?? [""] {
                tableView.objects.append(GeneralTableViewData(identifier: "attachmentTableViewCell", object: attach, height: 71))
            }
        }
    }
    
    func setupData() {
        DispatchQueue.main.async {
            self.tableViewHeightConstraint.constant = self.tableView.contentSize.height
        }
    }
}
