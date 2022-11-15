//
//  MoviesDetailRepository.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import Foundation

protocol MoviesDetailrepositoryProtocol {
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<MovieDetailQuery.Data, Error>) -> Void)
}

class MoviesDetailRepository: MoviesDetailrepositoryProtocol {
    
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<MovieDetailQuery.Data, Error>) -> Void) {
        let query = MovieDetailQuery(identifier: movieID)
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                guard let movieDetail = graphQLResult.data else { return }
                completion(.success(movieDetail))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
