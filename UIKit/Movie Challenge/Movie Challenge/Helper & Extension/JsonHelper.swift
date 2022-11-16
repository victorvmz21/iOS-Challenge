//
//  JsonHelper.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import Apollo
import Foundation

func convertJsonObjectToMovies(objectData: JSONObject) -> [Movie] {
    do {
        let data = try JSONSerialization.data(withJSONObject: objectData)
        let movie = try JSONDecoder().decode(MovieData.self, from: data)
        return movie.movies
    } catch let error {
        print("Error converting Data: \(error.localizedDescription)")
       return []
    }
}

func convertJsonObjectToMovie(objectData: JSONObject) -> Movie? {
    do {
        let data = try JSONSerialization.data(withJSONObject: objectData)
        let movie = try JSONDecoder().decode(MovieDetail.self, from: data)
        return movie.movie
    } catch let error {
        print("Error converting Data: \(error.localizedDescription)")
       return nil
    }
}
