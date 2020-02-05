//
//  UserProfile.swift
//  archivek
//
//  Created by Waleed Afifi on 03/02/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import Foundation

class UserProfile {
    static let shared = UserProfile()
    
    // get Phone number from user
    var accessToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "accessToken") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "accessToken")
            UserDefaults.standard.synchronize()
        }
    }
    
    func isUserLogin() -> Bool {
        return  accessToken != nil
    }
}
