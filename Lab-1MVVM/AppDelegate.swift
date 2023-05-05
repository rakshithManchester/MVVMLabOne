//
//  AppDelegate.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 03/05/23.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let windSize = UIScreen.main.bounds
        window = UIWindow(frame: windSize)
        let navigationController = AppDelegateFactoryMethods.getMainNavigationController()
        navigationController.setViewControllers([AppDelegateFactoryMethods.getrootViewController()], animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

protocol AppDelegateFactoryProtocol {
    static func getMainNavigationController() -> UINavigationController
    static func getrootViewController() -> MovielistViewController
}

class AppDelegateFactoryMethods: AppDelegateFactoryProtocol {
   static func getMainNavigationController() -> UINavigationController {
        return UINavigationController()
    }
    
    static func getrootViewController() -> MovielistViewController {
        return MovielistViewController(viewModel: MovielistViewModel())
    }
}
