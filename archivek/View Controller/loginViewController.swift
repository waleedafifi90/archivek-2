//
//  loginViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        var params: [String: Any] = [:]
        if let email = emailTextFiled.text, !email.isEmpty, let password = passwordTextFiled.text, !password.isEmpty {
            params["s_email"] = email
            params["s_password"] = password
            let request = LoginRequest().request(withParameters: params)
            RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
                UserProfile.shared.accessToken = json["user"][0]["s_access_token"].rawString()

                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "homeCategoryViewController")
                self.show(vc, sender: nil)
            }
        } else {
            self.showAlertPopUp(title: "خطا", message: "الرجاء التاكد من البيانات المدخلة!", buttonAction1: {
                
            }) {
                
            }
        }
    }
    
    @IBAction func forgetPasswordButtonPressed(_ sender: Any) {
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        passwordTextFiled.isSecureTextEntry.toggle()
    }
}

extension loginViewController {
    func setupView() {
        if UserProfile.shared.isUserLogin() {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "homeCategoryViewController")
            self.show(vc, sender: nil)
        }
        #if DEBUG
        emailTextFiled.text = "admin@admin.com"
        passwordTextFiled.text = "123456"
        #else
            
        #endif
    }
}
