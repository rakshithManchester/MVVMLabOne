//
//  MovieListCoordinator.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 06/05/23.
//

import UIKit

final class MovieListCoordinator : Coordinator {
    let navigation: UINavigationController
    var childCoordinator: [Coordinator] = []
    var appDelegateFactoryinit = AppDelegateFactoryMethods()
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
        childCoordinator.append(self)
    }
    
    func start() {
        navigation.setViewControllers([appDelegateFactoryinit.getrootViewController()], animated: true)
    }
}
