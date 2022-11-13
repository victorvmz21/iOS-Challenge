//
//  ViewModelFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func createMoviesListViewModel() -> MoviesListViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    func createMoviesListViewModel() -> MoviesListViewModel {
        return MoviesListViewModel()
    }
}
