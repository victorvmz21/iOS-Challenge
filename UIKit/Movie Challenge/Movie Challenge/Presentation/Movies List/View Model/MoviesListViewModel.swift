//
//  MoviesListViewModel.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit
import Apollo

class MoviesListViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var topFiveMovies: [Movie] = []
    @Published var genres: [String] = []
    @Published var isDataAvailable: Bool = false
    @Published var errorMessage: String? = nil
    
    let movieUseCase: MoviesUseCaseProtocol
    let coordinator: CoordinatorProtocol
    
    init(movieUseCase: MoviesUseCaseProtocol,
         coordinator: CoordinatorProtocol) {
        self.movieUseCase = movieUseCase
        self.coordinator = coordinator
    }
    
    func fetchMovies(completion: @escaping (Bool) -> Void) {
        movieUseCase.fetchMovies { result in
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
            completion(true)
        }
    }
    
    func fetchTopFiveMovies(completion: @escaping (Bool) -> Void) {
        movieUseCase.fetchTopFiveMovies { result in
            switch result {
            case .success(let movies):
                self.topFiveMovies = movies
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
            completion(true)
        }
    }
    
    func fetchGenres(completion: @escaping (Bool) -> Void) {
        movieUseCase.fetchGenres { result in
            switch result {
            case .success(let genres):
                self.genres = genres.genres
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
            completion(true)
        }
    }
    
    func getAllData() {
        fetchTopFiveMovies { isFinished in
            if isFinished {
                self.fetchGenres { isFinished in
                    if isFinished {
                        self.fetchMovies { isFinished in
                            if isFinished {
                                self.isDataAvailable = true
                            }
                        }
                    }
                }
            }
        }
        
    }
}
