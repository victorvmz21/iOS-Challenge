//
//  UseCaseFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol UseCaseFactoryProtocol {
    func createMovieUseCase() -> MoviesUseCase
    func createMoviesDetailUseCase() -> MoviesDetailUseCase
}

class UseCaseFactory: UseCaseFactoryProtocol {
    
    @Injected(\.repositoryFactory) var repositoryFactory
    
    func createMovieUseCase() -> MoviesUseCase {
        return MoviesUseCase(repository: repositoryFactory.createMoviesrepository())
    }
    
    func createMoviesDetailUseCase() -> MoviesDetailUseCase {
        return MoviesDetailUseCase(repository: repositoryFactory.createMoviesDetailRepository()
        )
    }
}
