//
//  searchViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {
    
    @IBOutlet weak var fileTypeLabel: UILabel!
    @IBOutlet weak var fileNameUITextFiled: UITextField!
    @IBOutlet weak var toDateUILabel: UITextField!
    @IBOutlet weak var fromDateUILabel: UITextField!
    
    var params: [String: Any] = [:]

    var objects: [Any] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func fromDateButtonPressed(_ sender: Any) {
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        myDatePicker.timeZone = NSTimeZone.local
        myDatePicker.frame = CGRect(x: 0, y: 15, width: 270, height: 200)

        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.view.addSubview(myDatePicker)
        let somethingAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in self.params["dt_from_date"] = (myDatePicker.date.dateToString(customFormat: "Y-MM-dd")); self.fromDateUILabel.text = myDatePicker.date.dateToString(customFormat: "Y-MM-dd") } )
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion:{})

    }
    
    @IBAction func toDateButtonPressed(_ sender: Any) {
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        myDatePicker.timeZone = NSTimeZone.local
        myDatePicker.frame = CGRect(x: 0, y: 15, width: 270, height: 200)

        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.view.addSubview(myDatePicker)
        let somethingAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in self.params["dt_to_date"] = (myDatePicker.date.dateToString(customFormat: "Y-MM-dd")); self.toDateUILabel.text = myDatePicker.date.dateToString(customFormat: "Y-MM-dd") } )
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion:{})
    }
    
    @IBAction func fileTypeButtonPressed(_ sender: Any) {
        getFileType()
        var actions: [(String, UIAlertAction.Style)] = []
        
        actions.append(("الغاء", UIAlertAction.Style.cancel))
        
        //self = ViewController
        self.showActionsheet(viewController: self, title: "نوع الملف", message: "قم باختيار نوع الملف", actions: actions) { (index) in
            self.fileTypeLabel.text = actions[index].0
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        params["s_key"] = fileNameUITextFiled.text
        
        params["fk_i_type_id"] = ""
        params["fk_i_project_id"] = ""
        params["fk_i_category_id"] = ""
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "searchResultViewController") as! searchResultViewController
        vc.params = params
        self.show(vc, sender: self)
    }    
}

extension searchViewController {
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

extension searchViewController {
    
}
