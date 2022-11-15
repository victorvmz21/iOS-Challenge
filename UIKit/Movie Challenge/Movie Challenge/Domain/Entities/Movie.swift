//
//  Movie.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let voteAverage: Double
    let posterPath: String
    let overview: String
    let genres: [Genre]?
    let cast: [Cast]?
    let director: Director?
}

struct Cast: Codable {
    let name: String
}

struct Director: Codable {
    let name: String
}

struct Genre: Codable {
    let name: String
}
