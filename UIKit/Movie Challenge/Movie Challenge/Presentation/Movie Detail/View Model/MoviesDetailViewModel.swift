//
//  MoviesDetailViewModel.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit

class MoviesDetailViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    @Published var movie: MovieDetailQuery.Data.Movie? = nil
    
    let coordinator: CoordinatorProtocol
    let moviesDetailUseCase: MoviesDetailUseCaseProtocol
    
    init(coordinator: CoordinatorProtocol,
         moviesDetailUseCase: MoviesDetailUseCaseProtocol) {
        self.coordinator = coordinator
        self.moviesDetailUseCase = moviesDetailUseCase
    }
    
    func dismissScreen(nav: UINavigationController) {
        coordinator.dismissScreen(nav: nav)
    }
    
    func fetchMovieDetails(movieID: Int) {
        moviesDetailUseCase.fetchMovieDetails(movieID: movieID) { result in
            switch result {
            case .success(let data):
                self.movie = data.movie
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
