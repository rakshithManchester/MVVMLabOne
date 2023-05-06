//
//  MovieListCoordinator.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 06/05/23.
//

import UIKit


class MovieListCoordinator : Coordinator {
    var navigation: UINavigationController
    var childCoordinator: [Coordinator] = []
    var movielistViewController: MovielistViewController!
    var appDelegateFactoryinit = AppDelegateFactoryMethods()
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        movielistViewController = appDelegateFactoryinit.getrootViewController()
        navigation.setViewControllers([movielistViewController], animated: true)
    }
    
}
