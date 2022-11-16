//
//  MoviesRepository.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation
import Apollo

protocol MoviesRepositoryProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchTopFiveMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchGenres(completion: @escaping (Result<GetGenresQuery.Data,Error>) -> Void)
    func fetchMoviesByGenre(genre: String, completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MoviesRepository: MoviesRepositoryProtocol {
    
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let query = GetMoviesQueryQuery()
        Network.shared.apollo.fetch(query: query) { result in
          switch result {
            case .success(let graphQLResult):
              guard let jsonData = graphQLResult.data?.jsonObject else { return }
              completion(.success(convertJsonObjectToMovies(objectData: jsonData)))
            case .failure(let error):
              completion(.failure(error))
          }
        }
    }
    
    func fetchTopFiveMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let query = TopMoviesQueryQuery()
        Network.shared.apollo.fetch(query: query) { result in
          switch result {
            case .success(let graphQLResult):
              guard let jsonData = graphQLResult.data?.jsonObject else { return }
              completion(.success(convertJsonObjectToMovies(objectData: jsonData)))
            case .failure(let error):
              completion(.failure(error))
          }
        }
    }
    
    func fetchGenres(completion: @escaping (Result<GetGenresQuery.Data, Error>) -> Void) {
        let query = GetGenresQuery()
        Network.shared.apollo.fetch(query: query) { result in
          switch result {
            case .success(let graphQLResult):
              guard let movieData = graphQLResult.data else { return }
              completion(.success(movieData))
            case .failure(let error):
              completion(.failure(error))
          }
        }
    }
    
    func fetchMoviesByGenre(genre: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let query = GetMoviesByGenresQuery(genre: genre)
        Network.shared.apollo.fetch(query: query) { result in
          switch result {
            case .success(let graphQLResult):
              guard let jsonData = graphQLResult.data?.jsonObject else { return }
              completion(.success(convertJsonObjectToMovies(objectData: jsonData)))
            case .failure(let error):
              completion(.failure(error))
          }
        }
    }
}
