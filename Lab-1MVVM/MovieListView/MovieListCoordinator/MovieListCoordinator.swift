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
    var movieListVC: MovielistViewController!
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
        childCoordinator.append(self)
    }
    func start() {
        movieListVC = appDelegateFactoryinit.getrootViewController()
        navigation.setViewControllers([movieListVC], animated: true)
    }
}

extension MovieListCoordinator {
    func navigateToDetailview() {
        //**** Navigate from here MovieDetailCoordinator
        movieListVC = appDelegateFactoryinit.getrootViewController()
//        movieListVC.selectionHandler! {
//            
//        }
    }
}
