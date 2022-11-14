//
//  MovieListViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit
import Combine

class MovieListViewController: UIViewController {
    
    var viewModel: MoviesListViewModel?
    private var cancellables: Set<AnyCancellable> = []
    
    var movieListView: MovieListView {
        guard let unwrappedView = self.view as? MovieListView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    required convenience init(viewModel: MoviesListViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func loadView() {
        self.view = MovieListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        viewModel?.getAllData()
        bindViewModel()
        
    }
    
    func setUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func bindViewModel() {
        viewModel?.$screenTitle.sink(receiveValue: { title in
            self.title = title
        }).store(in: &cancellables)
        
        viewModel?.$movies.sink(receiveValue: { movies in
            self.movieListView.movies = movies
        }).store(in: &cancellables)
        
        viewModel?.$topFiveMovies.sink(receiveValue: { movies in
            self.movieListView.topFiveMovies = movies
        }).store(in: &cancellables)
        
        viewModel?.$genres.sink(receiveValue: { genres in
            self.movieListView.genres = genres
        }).store(in: &cancellables)
        
        viewModel?.$isDataAvailable.sink(receiveValue: { isDataAvailable in
            if isDataAvailable {
                DispatchQueue.main.async {
                    self.movieListView.tableView.reloadData()
                }
            }
        }).store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
}
