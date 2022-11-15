//
//  Coordinator.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit

protocol CoordinatorProtocol {
    func toDetailScreen(movieID: Int, nav: UINavigationController)
    func dismissScreen(nav:UINavigationController)
}

class Coordinator: CoordinatorProtocol {
    
    @Injected(\.viewControllerFactory) var viewControllerFactory
    
    func toDetailScreen(movieID: Int, nav: UINavigationController) {
        let vc = viewControllerFactory.createMovieDetail()
        vc.movieID = movieID
        nav.pushViewController(vc, animated: true)
    }
    
    func dismissScreen(nav: UINavigationController) {
        nav.popViewController(animated: true)
    }
}
