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
    var movieItem: ItemList! //TODO: extra parameter is this correct inside Coordinator Pattern ? Else how to pass indexPath to Coordinator ?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    func start() {
        let detailVCFactory = DetailViewFactory()
        let detailVC = detailVCFactory.getDetailViewController(movieList: movieItem)
        navigation.pushViewController(detailVC, animated: true)
    }
}
