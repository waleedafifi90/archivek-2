//
//  userProfileViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signoutButtonPressed(_ sender: Any) {
        UserProfile.shared.accessToken = nil
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "loginViewController")
        self.show(vc, sender: nil)
    }
    
}
