//
//  Movie.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import Foundation
import Apollo

struct MovieData: Codable {
    let movies: [Movie]
}

struct MovieDetail: Codable {
    let movie: Movie
}
struct Movie: Codable {
    let id: Int?
    let title: String?
    var voteAverage: Double?
    var posterPath: String?
    var overview: String?
    var genres: [String]?
    var cast: [Cast]?
    var director: Director?
}

struct Cast: Codable {
    let name: String
}

struct Director: Codable {
    let name: String
}


