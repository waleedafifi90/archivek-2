//
//  attachmentTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 08/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import WebKit

class attachmentTableViewCell: GeneralTableViewCell, WKNavigationDelegate {
    
    @IBOutlet weak var fileNameUILabel: UILabel!
    @IBOutlet weak var fileIconUIImage: UIImageView!
    
    var documentInteractionController: NSObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func removeFileButtonPressed(_ sender: Any) {
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? String {
            let fileArray = obj.components(separatedBy: "/")
            self.fileNameUILabel.text = fileArray.last
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = self.object?.object as? String {
            let webView = WKWebView()
            webView.navigationDelegate = self
            self.parentVC?.view = webView
            let url: URL! = URL(string: obj)

            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
}
