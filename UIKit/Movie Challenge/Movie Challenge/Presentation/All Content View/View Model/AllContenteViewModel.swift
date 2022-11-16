//
//  AllContenteViewModel.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

class AllContenteViewModel: ObservableObject {
    
    @Published var moviesByGenre: [Movie] = []
    @Published var errorMessage: String? = nil
    
    let coordinator: CoordinatorProtocol
    let movieUseCase: MoviesUseCaseProtocol
    
    init(coordinator: CoordinatorProtocol,
         movieUseCase: MoviesUseCaseProtocol) {
        self.coordinator = coordinator
        self.movieUseCase = movieUseCase
    }
    
    func goToDetailScreen(movieID: Int, nav: UINavigationController) {
        coordinator.toDetailScreen(movieID: movieID, nav: nav)
    }
    
    func fetchMoviesByGenre(genre: String?) {
        guard let genre = genre else { return }
        movieUseCase.fetchMoviesByGenre(genre: genre) { result in
            switch result {
            case .success(let movies):
                self.moviesByGenre = movies.sorted(by: {$0.title ?? "" > $1.title ?? ""})
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
