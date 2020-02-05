//
//  mainNavigationViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class mainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.shared.rootNavigationViewController = self
    }
}
