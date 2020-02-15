//
//  searchViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class searchViewController: UIViewController {
    
    @IBOutlet weak var fileTypeLabel: UILabel!
    @IBOutlet weak var fileNameUITextFiled: UITextField!
    @IBOutlet weak var toDateUILabel: UITextField!
    @IBOutlet weak var fromDateUILabel: UITextField!
    @IBOutlet weak var categoryUILabel: UILabel!
    @IBOutlet weak var projectUILabel: UILabel!
    
    
    var params: [String: Any] = [:]
    var objects: [Constant] = []
    var array: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func fromDateButtonPressed(_ sender: Any) {
        let datePicker = ActionSheetDatePicker(title: "من تاريخ",
                                               datePickerMode: UIDatePicker.Mode.date,
                                               selectedDate: Date(),
                                               doneBlock: { picker, date, origin in
                                                print("date = \(String(describing: date))")
                                                self.params["dt_from_date"] = String(describing: date!)
                                                self.fromDateUILabel.text = String(describing: date!).stringToDate().dateToString(customFormat: "Y-MM-dd")
                                                return
        },
                                               cancel: { picker in
                                                return
        },
                                               origin: (sender as AnyObject).superview?.superview)

        datePicker?.show()
        
    }
    
    @IBAction func toDateButtonPressed(_ sender: Any) {
        let datePicker = ActionSheetDatePicker(title: "الى تاريخ",
                                               datePickerMode: UIDatePicker.Mode.date,
                                               selectedDate: Date(),
                                               doneBlock: { picker, date, origin in
                                                print("date = \(String(describing: date))")
                                                self.params["dt_to_date"] = String(describing: date!)
                                                self.toDateUILabel.text = String(describing: date!).stringToDate().dateToString(customFormat: "Y-MM-dd")
                                                return
        },
                                               cancel: { picker in
                                                return
        },
                                               origin: (sender as AnyObject).superview?.superview)

        datePicker?.show()
        
    }
    
    @IBAction func fileTypeButtonPressed(_ sender: Any) {
        getFileType(sKey: "FILE_TYPE")
        array = []
        for obj in objects {
            array.append(obj.sValue!)
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            ActionSheetStringPicker.show(withTitle: "اختر نوع الملف",
                                         rows: self.array,
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            //           print("picker = \(String(describing: picker))")
                                            //           print("value = \(value)")
                                            self.params["fk_i_type_id"] = self.objects[value].pkIId
                                            self.fileTypeLabel.text = String(describing: index!)
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
//        }
    }
    
    @IBAction func projectButtonPressed(_ sender: Any) {
        getFileType(sKey: "PROJECTS")
        array = []
        for obj in objects {
            array.append(obj.sValue!)
        }
        DispatchQueue.main.async {
            ActionSheetStringPicker.show(withTitle: "اختر مشروع ",
                                         rows: self.array,
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            //           print("picker = \(String(describing: picker))")
                                            //           print("value = \(value)")
                                            self.params["fk_i_project_id"] = self.objects[value].pkIId
                                            self.projectUILabel.text = String(describing: index!)
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
        }
    }
    
    @IBAction func categoryButtonPressed(_ sender: Any) {
        getFileType(sKey: "FILE_TYPE")
        array = []
        for obj in objects {
            array.append(obj.sValue!)
        }
        DispatchQueue.main.async {
            ActionSheetStringPicker.show(withTitle: "اختر تصنيف",
                                         rows: self.array,
                                         initialSelection: 1,
                                         doneBlock: { picker, value, index in
                                            //           print("picker = \(String(describing: picker))")
                                            //           print("value = \(value)")
                                            self.params["fk_i_category_id"] = self.objects[value].pkIId
                                            self.categoryUILabel.text = String(describing: index!)
                                            return
            },
                                         cancel: { picker in
                                            return
            },
                                         origin: sender)
        }
    }
    
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        params["s_key"] = fileNameUITextFiled.text
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "searchResultViewController") as! searchResultViewController
        vc.params = params
        self.show(vc, sender: self)
    }    
}

extension searchViewController {
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

extension searchViewController {
    
}
