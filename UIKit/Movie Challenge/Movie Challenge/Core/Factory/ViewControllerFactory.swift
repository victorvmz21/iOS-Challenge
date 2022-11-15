//
//  ViewControllerFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    func createMovieListViewController() -> MovieListViewController
    func createMovieDetailViewController() -> MovieDetailViewController
    func createAllContentViewController() -> AllContentViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    @Injected(\.viewModelFactory) var viewModelFactory
    
    func createMovieListViewController() -> MovieListViewController {
        return MovieListViewController(
            viewModel: viewModelFactory.createMoviesListViewModel()
        )
    }
    
    func createMovieDetailViewController() -> MovieDetailViewController {
        return MovieDetailViewController(viewModel: viewModelFactory.createMoviesDetailViewModel())
    }
    
    func createAllContentViewController() -> AllContentViewController {
        return AllContentViewController(viewModel: viewModelFactory.createAllContentViewModel())
    }
}
