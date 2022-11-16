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
    
    var defaultMovies: [Movie] = []
    var defaultTopFiveMovies: [Movie] = []
    var defaultGenres: [String] = []
    
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
                self.defaultMovies = movies
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
                self.defaultTopFiveMovies = movies
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
                self.defaultGenres = genres.genres
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
    
    func filterLists(searchTerm: String, shouldReset: Bool) {
        
        if shouldReset {
            self.movies = self.defaultMovies
            self.genres = self.defaultGenres
            self.topFiveMovies = self.defaultTopFiveMovies
        } else {
            self.movies =  self.movies.filter { $0.title!.contains(searchTerm) }
            self.genres = self.genres.filter { $0.contains(searchTerm) }
            self.topFiveMovies =  self.topFiveMovies.filter { $0.title!.contains(searchTerm) }
        }
    }
}
