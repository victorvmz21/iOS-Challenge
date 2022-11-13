//
//  MoviesListViewModel.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation
import Apollo

class MoviesListViewModel: ObservableObject {
    
    @Published
    var screenTitle: String = "Movies"
    
    @Published
    var movies: [GetMoviesQueryQuery.Data.Movie?] = []
    
    @Published
    var errorMessage: String = ""
    
    let movieUseCase: MoviesUseCaseProtocol
    
    init(movieUseCase: MoviesUseCaseProtocol) {
        self.movieUseCase = movieUseCase
    }
    
    func fetchMovies() {
        movieUseCase.fetchMovies { result in
            switch result {
            case .success(let movies):
                guard let moviesList = movies.movies else { return }
                self.movies = moviesList
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
