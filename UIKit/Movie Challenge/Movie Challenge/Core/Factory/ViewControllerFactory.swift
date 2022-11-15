//
//  ViewControllerFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    func createMovieListViewController() -> MovieListViewController
    func createMovieDetail() -> MovieDetailViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    @Injected(\.viewModelFactory) var viewModelFactory
    
    func createMovieListViewController() -> MovieListViewController {
        return MovieListViewController(
            viewModel: viewModelFactory.createMoviesListViewModel()
        )
    }
    
    func createMovieDetail() -> MovieDetailViewController {
        return MovieDetailViewController(viewModel: viewModelFactory.createMoviesDetailViewModel())
    }
}
