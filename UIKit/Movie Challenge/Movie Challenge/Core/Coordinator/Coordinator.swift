//
//  Coordinator.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit

protocol CoordinatorProtocol {
    func toDetailScreen(movieID: Int, nav: UINavigationController)
    func toAllContentScreen(allMovies: [GetMoviesQueryQuery.Data.Movie?]?, genreIdentifier: String?, nav: UINavigationController)
    func dismissScreen(nav:UINavigationController)
}

class Coordinator: CoordinatorProtocol {
    
    @Injected(\.viewControllerFactory) var viewControllerFactory
    
    func toDetailScreen(movieID: Int, nav: UINavigationController) {
        let vc = viewControllerFactory.createMovieDetailViewController()
        vc.movieID = movieID
        nav.pushViewController(vc, animated: true)
    }
    
    func toAllContentScreen(allMovies: [GetMoviesQueryQuery.Data.Movie?]?, genreIdentifier: String?, nav: UINavigationController) {
        let vc = viewControllerFactory.createAllContentViewController()
        vc.allMovies = allMovies
        vc.genre = genreIdentifier
        nav.pushViewController(vc, animated: true)
    }
    
    func dismissScreen(nav: UINavigationController) {
        nav.popViewController(animated: true)
    }
}
