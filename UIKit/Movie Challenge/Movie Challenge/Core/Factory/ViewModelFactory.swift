//
//  ViewModelFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func createMoviesListViewModel() -> MoviesListViewModel
    func createMoviesDetailViewModel() -> MoviesDetailViewModel
    func createAllContentViewModel() -> AllContenteViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    
    @Injected(\.useCaseFactory) var useCaseFactory
    @Injected(\.coordinatorFactory) var coordinatorFactory
    
    func createMoviesListViewModel() -> MoviesListViewModel {
        return MoviesListViewModel(
            movieUseCase: useCaseFactory.createMovieUseCase(),
            coordinator: coordinatorFactory.createMainCoordinator()
        )
    }
    
    func createMoviesDetailViewModel() -> MoviesDetailViewModel {
        return MoviesDetailViewModel(
            coordinator: coordinatorFactory.createMainCoordinator(),
            moviesDetailUseCase: useCaseFactory.createMoviesDetailUseCase()
        )
    }
    
    func createAllContentViewModel() -> AllContenteViewModel {
        return AllContenteViewModel(coordinator: coordinatorFactory.createMainCoordinator())
    }
}
