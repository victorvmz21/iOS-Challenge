//
//  MoviesDetailUseCase.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import Foundation

protocol MoviesDetailUseCaseProtocol {
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie?, Error>) -> Void)
}

class MoviesDetailUseCase: MoviesDetailUseCaseProtocol {
    
    let repository: MoviesDetailrepositoryProtocol
    
    init(repository: MoviesDetailrepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie?, Error>) -> Void) {
        repository.fetchMovieDetails(movieID: movieID, completion: completion)
    }
}
