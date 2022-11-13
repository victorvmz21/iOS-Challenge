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
        viewModel?.fetchMovies()
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
            DispatchQueue.main.async {
                self.movieListView.tableView.reloadData()
            }
        }).store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
}
