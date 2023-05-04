//
//  AppDelegate.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let windSize = UIScreen.main.bounds
        window = UIWindow(frame: windSize)
        window?.rootViewController = UINavigationController(rootViewController: MovielistViewController(_viewModel: MovielistViewModel()))
        window?.makeKeyAndVisible()
        return true
    }
}

