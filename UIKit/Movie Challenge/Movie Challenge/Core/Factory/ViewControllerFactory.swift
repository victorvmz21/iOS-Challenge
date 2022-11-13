//
//  ViewControllerFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    func createMovieListViewController() -> MovieListViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    @Injected(\.viewModelFactory) var viewModelFactory
    
    func createMovieListViewController() -> MovieListViewController {
        return MovieListViewController(viewModel: viewModelFactory.createMoviesListViewModel())
    }
}
