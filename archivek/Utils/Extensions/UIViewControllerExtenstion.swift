//
//  UIViewControllerExtenstion.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 19/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertPopUp(title: String, message: String, buttonTitle1: String = "OK", buttonTitle2: String = "Cancel", buttonTitleStyle1: UIAlertAction.Style = .default, buttonTitleStyle2: UIAlertAction.Style = .default, buttonAction1: @escaping (()->Void), buttonAction2: @escaping (()->Void)) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let button1 = UIAlertAction.init(title: buttonTitle1, style: buttonTitleStyle1) { (action) in
            print("OK Button")
            buttonAction1()
        }
        let button2 = UIAlertAction.init(title: buttonTitle2, style: buttonTitleStyle2) { (action) in
            print("Cancel Button")
            buttonAction2()
        }
        
        alert.addAction(button1 )
        alert.addAction(button2)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorPopUp(title: String, message: String, buttonTitle1: String = "OK", buttonTitleStyle1: UIAlertAction.Style = .default, buttonAction1: @escaping (()->Void)) {
         let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
         let button1 = UIAlertAction.init(title: buttonTitle1, style: buttonTitleStyle1) { (action) in
             print("OK Button")
             buttonAction1()
         }

         alert.addAction(button1)
         self.present(alert, animated: true, completion: nil)
     }
    
    func hideKeyboardWhenTappedAround() {
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
     }

     @objc func dismissKeyboard() {
         view.endEditing(true)
     }
    
    func prefersLargTitle(withTitle title: String) {
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: K.General.loadingFontName, size: 20)!]
        let navigationItem = UINavigationItem()
        navigationItem.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.items = [navigationItem]
        self.view.addSubview(self.navigationController!.navigationBar)
    }
    
    func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
    let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    for (index, (title, style)) in actions.enumerated() {
        let alertAction = UIAlertAction(title: title, style: style) { (_) in
            completion(index)
        }
        alertViewController.addAction(alertAction)
     }
     viewController.present(alertViewController, animated: true, completion: nil)
    }
}
