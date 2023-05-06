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
    var appDelegateFactoryinit = AppDelegateFactoryMethods()
    var movieListCoordinator: MovieListCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let windSize = UIScreen.main.bounds
        window = UIWindow(frame: windSize)
        let navigationController = UINavigationController()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        movieListCoordinator = MovieListCoordinator(navigation: window?.rootViewController as!
                                                    UINavigationController)
        movieListCoordinator.start()
        return true
    }
}

protocol AppDelegateFactoryProtocol {
    func getrootViewController() -> MovielistViewController
}

class AppDelegateFactoryMethods: AppDelegateFactoryProtocol {
    let vm = MovielistViewModel()
    
    func getrootViewController() -> MovielistViewController {
        return MovielistViewController(viewModel: vm,factory: self)
    }
}
