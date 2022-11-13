//
//  MovieListViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit

class MovieListViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()

      // Example for how to use the demo GetMovies query to fetch data from the server.
      let query = GetMoviesQueryQuery()
      Network.shared.apollo.fetch(query: query) { result in
        switch result {
          case .success(let graphQLResult):
            print("Found \(graphQLResult.data?.movies?.first??.title ?? "") movies")

          case .failure(let error):
            print("Error getting movies: \(error.localizedDescription)")
        }
      }
    }

}
