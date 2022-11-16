//
//  MoviesDetailRepository.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import Foundation

protocol MoviesDetailrepositoryProtocol {
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie?, Error>) -> Void)
}

class MoviesDetailRepository: MoviesDetailrepositoryProtocol {
    
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie?, Error>) -> Void) {
        let query = MovieDetailQuery(identifier: movieID)
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                guard let jsonData = graphQLResult.data?.jsonObject else { return }
                completion(.success(convertJsonObjectToMovie(objectData: jsonData)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
