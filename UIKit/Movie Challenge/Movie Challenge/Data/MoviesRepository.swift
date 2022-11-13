//
//  MoviesRepository.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation
import Apollo

protocol MoviesRepositoryProtocol {
    func fetchMovies(completion: @escaping (Result<GetMoviesQueryQuery.Data,Error>) -> Void)
}

class MoviesRepository: MoviesRepositoryProtocol {
    func fetchMovies(completion: @escaping (Result<GetMoviesQueryQuery.Data, Error>) -> Void) {
        
        let query = GetMoviesQueryQuery()
        Network.shared.apollo.fetch(query: query) { result in
          switch result {
            case .success(let graphQLResult):
              print("Found \(graphQLResult.data?.movies?.count ?? 0) movies")
              guard let movieData = graphQLResult.data else { return }
              completion(.success(movieData))
            case .failure(let error):
              print("Error getting movies: \(error.localizedDescription)")
              completion(.failure(error))
          }
        }
    }
}

