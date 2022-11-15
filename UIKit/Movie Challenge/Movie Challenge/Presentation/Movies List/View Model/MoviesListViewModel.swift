//
//  MoviesListViewModel.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit
import Apollo

class MoviesListViewModel: ObservableObject {
    
    @Published var screenTitle: String = "Movies"
    @Published var movies: [GetMoviesQueryQuery.Data.Movie?] = []
    @Published var topFiveMovies: [TopMoviesQueryQuery.Data.Movie?] = []
    @Published var genres: [String] = []
    @Published var isDataAvailable: Bool = false
    @Published var errorMessage: String = ""
    
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
                guard let moviesList = movies.movies else { return }
                self.movies = moviesList
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
                guard let moviesList = movies.movies else { return }
                self.topFiveMovies = moviesList
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
