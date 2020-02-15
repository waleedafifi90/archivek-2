//
//  emptyCellTableViewCell.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import MobileCoreServices

class emptyCellTableViewCell: GeneralTableViewCell {

    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "newFileViewController") as! newFileViewController

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func configureCell() { }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let importMenu = UIDocumentPickerViewController(documentTypes: ["com.apple.iwork.pages.pages", "com.apple.iwork.numbers.numbers", "com.apple.iwork.keynote.key","public.image", "com.apple.application", "public.item","public.data", "public.content", "public.audiovisual-content", "public.movie", "public.audiovisual-content", "public.video", "public.audio", "public.text", "public.data", "public.zip-archive", "com.pkware.zip-archive", "public.composite-content", "public.text", kUTTypePDF as String], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.parentVC?.present(importMenu, animated: true, completion: nil)
    }
}

extension emptyCellTableViewCell: UIDocumentMenuDelegate, UIDocumentPickerDelegate, UINavigationControllerDelegate {
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        self.parentVC?.present(documentPicker, animated: true, completion: nil)
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        Variables.sAttachments.append(myURL)
        vc.perform(#selector(vc.loadTable), with: nil, afterDelay: 0.3)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        self.parentVC?.dismiss(animated: true, completion: nil)
    }
}
