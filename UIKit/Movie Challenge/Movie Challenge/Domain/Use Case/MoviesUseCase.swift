//
//  MoviesUseCase.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol MoviesUseCaseProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchTopFiveMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchGenres(completion: @escaping (Result<GetGenresQuery.Data,Error>) -> Void)
    func fetchMoviesByGenre(genre: String, completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MoviesUseCase: MoviesUseCaseProtocol {

    let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.fetchMovies(completion: completion)
    }
    
    func fetchTopFiveMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.fetchTopFiveMovies(completion: completion)
    }
    
    func fetchGenres(completion: @escaping (Result<GetGenresQuery.Data,Error>) -> Void) {
        repository.fetchGenres(completion: completion)
    }
    
    func fetchMoviesByGenre(genre: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.fetchMoviesByGenre(genre: genre, completion: completion)
    }
}
