//
//  userProfileViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController {
    
    @IBOutlet weak var fullNameUITextField: UITextField!
    @IBOutlet weak var emailUITextField: UITextField!
    @IBOutlet weak var phoneNumberUITextField: UITextField!
    @IBOutlet weak var passwordUITextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    @IBAction func signoutButtonPressed(_ sender: Any) {
        UserProfile.shared.accessToken = nil
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "loginViewController")
        self.show(vc, sender: nil)
    }
    
}

extension userProfileViewController {
    func setupView() {
        let infoImage = UIImage(named: "signoutIcon")
        let imgWidth = infoImage?.size.width
        let imgHeight = infoImage?.size.height
        let button:UIButton = UIButton(frame: CGRect(x: 0,y: 0,width: imgWidth!, height: imgHeight!))
        button.setBackgroundImage(infoImage, for: .normal)
        button.addTarget(self, action: #selector(signoutButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func fetchData() {
        
    }
}
