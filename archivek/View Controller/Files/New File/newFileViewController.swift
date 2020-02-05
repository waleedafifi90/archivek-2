//
//  newFileViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import MobileCoreServices

class newFileViewController: UIViewController {
    
    @IBOutlet weak var privateUIView: UIView!
    @IBOutlet weak var publicUIView: UIView!
    @IBOutlet weak var fileNameUILabel: UILabel!
    @IBOutlet weak var fileSizeUILabel: UILabel!
    
    var categoryId: Int = 1
    var fileType: [Any] = []
    var fileExtension: [Any] = []
    var project: [Any] = []
    var objects: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    
    @IBAction func privateButtonPressed(_ sender: Any) {
        privateUIView.backgroundColor = "9B1C1C".color_
        publicUIView.backgroundColor = "ffffff".color_
    }
    @IBAction func publicButtonPressed(_ sender: Any) {
        publicUIView.backgroundColor = "9B1C1C".color_
        privateUIView.backgroundColor = "ffffff".color_
    }
    @IBAction func mainAttachmentButtonPressed(_ sender: Any) {
        let importMenu = UIDocumentPickerViewController(documentTypes: [kUTTypePDF as String], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func mainAttachmentDeleteButtonPressed(_ sender: Any) {
    }
    
    @IBAction func fileExtensionButtonPressed(_ sender: Any) {
        getExtension()
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 200,height: 200)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "sss", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    
    @IBAction func fileTypeButtonPressed(_ sender: Any) {
        getFileType()
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 200,height: 200)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "sss", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    
    @IBAction func projectButtonPressed(_ sender: Any) {
        getProject()
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 200,height: 200)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "sss", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    
    @IBAction func fileStatusButtonPressed(_ sender: Any) {
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let request = FileRequest()
        request.files = []
        RequestBuilder.requestWithSuccessFullResponse(request: request.request()) { (json) in
            
        }
    }
}

extension newFileViewController {
    func setupView() { }
    
    func fetchData() {
        
    }
    
    func getProject() {
        let parameters = ["s_key": "PROJECTS"]
        let request = ConstantRequest()
        request.parameters = parameters
        RequestBuilder.requestWithSuccessFullResponse(request: request.request(withParameters: parameters, withRequestType: .byid)) { (json) in
            var array: [Any] = []
            for item in json["constants"].array ?? [] {
                let obj = Constant.init(fromJson: item)
                array.append(obj)
            }
            self.objects = array
            debugPrint(self.objects)
        }
    }
    
    func getExtension() {
        let parameters = ["s_key": "EXTENSION"]
        let request = ConstantRequest()
        request.parameters = parameters
        RequestBuilder.requestWithSuccessFullResponse(request: request.request(withParameters: parameters, withRequestType: .byid)) { (json) in
            var array: [Any] = []
            for item in json["constants"].array ?? [] {
                let obj = Constant.init(fromJson: item)
                array.append(obj)
            }
            self.objects = array
            debugPrint(self.objects)
        }
    }
    
    func getFileType() {
        let parameters = ["s_key": "FILE_TYPE"]
        let request = ConstantRequest()
        request.parameters = parameters
        RequestBuilder.requestWithSuccessFullResponse(request: request.request(withParameters: parameters, withRequestType: .byid)) { (json) in
            var array: [Any] = []
            for item in json["constants"].array ?? [] {
                let obj = Constant.init(fromJson: item)
                array.append(obj)
            }
            self.objects = array
            
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
        //        print("import result : \(myURL.pathExtension)")
        self.fileNameUILabel.text = myURL.lastPathComponent
        
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

extension newFileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.subviews.forEach({
            $0.isHidden = $0.frame.height < 1.0
        })
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.objects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        K.NotificationConstant.newData["iType"] = row
//        DispatchQueue.main.async {
//            self.conditionValueLabel.text = K.NotificationConstant.dropDownOptionArray[row]
//        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.objects[row] as! String
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        
        label.textColor = .black
        label.textAlignment = .center
//        label.font = UIFont(name: K.General.fontName, size: 11)
//
  
        if let obj = self.objects[row] as? Constant {
            label.text = obj.sValue
        }
        return label
    }
    
    
}
