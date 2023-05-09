//
//  MovieDetailCoordinator.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 08/05/23.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {
    var navigation: UINavigationController!
    var childCoordinator: [Coordinator] = []
    var movieDetail: MovieDetail!
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    func start() {
        let detailVCFactory = DetailViewFactory()
        let detailVC = detailVCFactory.getDetailViewController(movieList: movieDetail)
        navigation.pushViewController(detailVC, animated: true)
    }
}
