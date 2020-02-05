//
//  AppDelegate.swift
//  archivek
//
//  Created by Waleed Afifi on 29/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

extension UIStoryboard {
    static let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var window: UIWindow?
    
    var rootNavigationViewController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let backImage = UIImage(named: "arrowBackIcon")?.withRenderingMode(.alwaysOriginal)
//        UINavigationBar.appearance().backIndicatorImage = backImage
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -80.0), for: .default)
        
        IQKeyboardManager.shared.enable = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

