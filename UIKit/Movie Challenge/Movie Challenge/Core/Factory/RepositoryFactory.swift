//
//  RepositoryFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol RepositoryFactoryProtocol {
    func createMoviesrepository() -> MoviesRepository
}

class RepositoryFactory: RepositoryFactoryProtocol {
    func createMoviesrepository() -> MoviesRepository {
        return MoviesRepository()
    }
}
