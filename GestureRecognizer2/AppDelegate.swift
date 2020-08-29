//
//  AppDelegate.swift
//  GestureRecognizer2
//
//  Created by Valerie Don on 6/25/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let vc = ViewController()
        let frame = UIScreen.main.bounds
        window?.frame = frame
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

