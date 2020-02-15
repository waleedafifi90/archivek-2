//
//  newFileViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import MobileCoreServices

class newFileViewController: UIViewController {
    
    @IBOutlet weak var tableView: GeneralTableView!
    @IBOutlet weak var privateUIView: UIView!
    @IBOutlet weak var publicUIView: UIView!
    @IBOutlet weak var fileNameUILabel: UILabel!
    @IBOutlet weak var fileSizeUILabel: UILabel!
    @IBOutlet weak var fileExtensionUILabel: UILabel!
    @IBOutlet weak var fileTypeUILabel: UILabel!
    @IBOutlet weak var projectUILabel: UILabel!
    @IBOutlet weak var fileStatusUILabel: UILabel!
    @IBOutlet weak var fileNameUITextField: UITextField!
    @IBOutlet weak var fileNumberUITextField: UITextField!
    @IBOutlet weak var descriptionUITextField: UITextField!
    @IBOutlet weak var categoryNameUILabel: UILabel!
    @IBOutlet weak var tableViewConstraint: NSLayoutConstraint!
    
    var categoryId: Int = 1
    var categoryName: String = ""
    var fileType: [Any] = []
    var fileExtension: [Any] = []
    var project: [Any] = []
    
    var params: [String: Any] = [:]
    var objects: [Constant] = []
    var array: [Any] = []
    var sFile: URL?
    var sAttachment: [URL] = []
    let file = BaseFile()
    var attachment = BaseFile()
    let request = FileRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
        //        self.tableViewConstraint.constant = self.tableView.contentSize.height
    }
    
    
    @IBAction func privateButtonPressed(_ sender: Any) {
        privateUIView.backgroundColor = "9B1C1C".color_
        publicUIView.backgroundColor = "ffffff".color_
        params["b_secret"] = 1
    }
    @IBAction func publicButtonPressed(_ sender: Any) {
        publicUIView.backgroundColor = "9B1C1C".color_
        privateUIView.backgroundColor = "ffffff".color_
        params["b_secret"] = 0
        
    }
    @IBAction func mainAttachmentButtonPressed(_ sender: Any) {
        let importMenu = UIDocumentPickerViewController(documentTypes: ["com.apple.iwork.pages.pages", "com.apple.iwork.numbers.numbers", "com.apple.iwork.keynote.key","public.image", "com.apple.application", "public.item","public.data", "public.content", "public.audiovisual-content", "public.movie", "public.audiovisual-content", "public.video", "public.audio", "public.text", "public.data", "public.zip-archive", "com.pkware.zip-archive", "public.composite-content", "public.text", kUTTypePDF as String], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func mainAttachmentDeleteButtonPressed(_ sender: Any) {
    }
    
    @IBAction func fileExtensionButtonPressed(_ sender: Any) {
        getFileType(sKey: "EXTENSION")
        array = []
        for obj in objects {
            array.append(obj.sValue!)
        }
        DispatchQueue.main.async {
            ActionSheetStringPicker.show(withTitle: "اختر امتداد الملف  ",
                                         rows: self.array,
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            self.params["fk_i_extension_id"] = self.objects[value].fkIParentId!
                                            self.fileExtensionUILabel.text = String(describing: index!)
                                            self.file.type = FileDataType(rawValue: self.objects[value].sExtra1!) ?? .docx
                                            self.attachment.type = FileDataType(rawValue: self.objects[value].sExtra1!) ?? .docx
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
        }
        
    }
    
    @IBAction func fileTypeButtonPressed(_ sender: Any) {
        
        getFileType(sKey: "FILE_TYPE")
        array = []
        for obj in objects {
            array.append(obj.sValue!)
        }
        
        DispatchQueue.main.async {
            ActionSheetStringPicker.show(withTitle: "اختر نوع الملف ",
                                         rows: self.array,
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            //           print("picker = \(String(describing: picker))")
                                            //           print("value = \(value)")
                                            self.params["fk_i_type_id"] = self.objects[value].pkIId
                                            self.fileTypeUILabel.text = String(describing: index!)
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
        }
        
    }
    
    @IBAction func projectButtonPressed(_ sender: Any) {
        getFileType(sKey: "PROJECTS")
        array = []
        for obj in objects {
            array.append(obj.sValue!)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
          ActionSheetStringPicker.show(withTitle: "اختر مشروع ",
                                         rows: self.array,
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            self.params["fk_i_project_id"] = self.objects[value].pkIId
                                            self.projectUILabel.text = String(describing: index!)
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
        })
    }
    
    @IBAction func fileStatusButtonPressed(_ sender: Any) {
        DispatchQueue.main.async {
            ActionSheetStringPicker.show(withTitle: "حالة الملف ",
                                         rows: ["فعال", "غير فعال"],
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            //           print("picker = \(String(describing: picker))")
                                            //           print("value = \(value)")
                                            if value == 0 {
                                                self.params["b_enabled"] = true
                                            } else {
                                                self.params["b_enabled"] = false
                                            }
                                            self.fileStatusUILabel.text = String(describing: index!)
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        params["s_name"] = fileNameUITextField.text
        params["s_file_number"] = fileNumberUITextField.text
        params["fk_i_category_id"] = categoryId
        params["s_notes"] = ""
        params["s_description"] = descriptionUITextField.text
        file.name = "s_file"
        if let url = self.sFile {
            let pdfData = try? Data(contentsOf: url)
            file.data = pdfData
            request.files.append(file)
            params["s_file"] = file.data
        }
        
        if Variables.sAttachments.count > 0 {
            for attach in Variables.sAttachments {
                let attachData = try? Data(contentsOf: attach)
                attachment.data = attachData
                attachment.name = "attachments[]"
                request.files.append(attachment)
                params["attachments[]"] = attachment.data
            }
        }
        
        RequestBuilder.requestWithSuccessFullResponse(request: request.request(withParameters: self.params, withRequestType: .post)) { (json) in
            Variables.sAttachments.removeAll()
        }
    }
}

extension newFileViewController {
    func setupView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "حفظ", style: .done, target: self, action: #selector(saveButtonPressed))
        self.tableView.registerNib(withIdentifier: ["emptyCellTableViewCell", "hasFileTableViewCell"])
        DispatchQueue.main.async {
            self.categoryNameUILabel.text = self.categoryName
        }
    }
    
    func fetchData() {
        tableView.objects.append(GeneralTableViewData(identifier: "emptyCellTableViewCell", object: "attach", height: nil))
    }
    
    @objc func loadTable() {
        DispatchQueue.main.async {
//            self.tableView.reloadData()
        }
    }
    
    func getFileType(sKey: String) {
        array = []
        let parameters = ["s_key": sKey]
        let request = ConstantRequest()
        request.parameters = parameters
        RequestBuilder.requestWithSuccessFullResponse(request: request.request(withParameters: parameters, withRequestType: .byid)) { (json) in
            self.objects.removeAll()
            for item in json["constants"].array ?? [] {
                let obj = Constant.init(fromJson: item)
                self.objects.append(obj!)
            }
            debugPrint(self.objects)
        }
    }
}

extension newFileViewController: UIDocumentMenuDelegate, UIDocumentPickerDelegate, UINavigationControllerDelegate {
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        self.fileNameUILabel.text = myURL.lastPathComponent
        self.sFile = myURL
        
        do {
            let resources = try myURL.resourceValues(forKeys:[.fileSizeKey])
            let fileSize = resources.fileSize!
            if (fileSize/1024/1024) < 1 {
                self.fileSizeUILabel.text = "\(fileSize/1024)KB"
            } else {
                self.fileSizeUILabel.text = "\(fileSize/1024/1024)MB"
            }
        } catch { }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
}
