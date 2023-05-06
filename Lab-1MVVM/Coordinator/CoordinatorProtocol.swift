//
//  CoordinatorProtocol.swift
//  Lab-1MVVM
//
//  Created by Appaiah on 06/05/23.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    
    init(navigation: UINavigationController)
    func start()
    var childCoordinator: [Coordinator] {get set}
}
