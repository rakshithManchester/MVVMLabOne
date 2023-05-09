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
        movieListVC.selectionHandler = { (selectedIndex,movieList) in
            self.navigateToDetailview(selectedIndex: selectedIndex, movieList: movieList)
        }
        navigation.setViewControllers([movieListVC], animated: true)
    }
}

extension MovieListCoordinator {
    func navigateToDetailview(selectedIndex: Int, movieList: MovieList) {
        let movieDetailCoordinator = MovieDetailCoordinator(navigation: self.navigation)
        movieDetailCoordinator.movieDetail = movieList.moviesDetailList[selectedIndex]
        movieDetailCoordinator.start()
    }
}
