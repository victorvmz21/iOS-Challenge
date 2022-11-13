//
//  MoviesUseCase.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol MoviesUseCaseProtocol {
    func fetchMovies(completion: @escaping (Result<GetMoviesQueryQuery.Data,Error>) -> Void)
}

class MoviesUseCase: MoviesUseCaseProtocol {

    let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovies(completion: @escaping (Result<GetMoviesQueryQuery.Data, Error>) -> Void) {
        repository.fetchMovies(completion: completion)
    }
}
