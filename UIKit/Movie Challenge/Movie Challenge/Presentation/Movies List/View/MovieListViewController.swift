//
//  MovieListViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit
import Combine

class MovieListViewController: UIViewController {
    
    var viewModel: MoviesListViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    var movieListView: MovieListView {
        guard let unwrappedView = self.view as? MovieListView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MovieListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        viewModel.getAllData()
        bindViewModel()
        
    }
    
    func setUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        movieListView.coordinator = viewModel.coordinator
        movieListView.nav = self.navigationController
    }
    
    func bindViewModel() {
        viewModel.$screenTitle.sink { title in
            self.title = title
        }.store(in: &cancellables)
        
        viewModel.$movies.sink{ movies in
            self.movieListView.movies = movies
        }.store(in: &cancellables)
        
        viewModel.$topFiveMovies.sink { movies in
            self.movieListView.topFiveMovies = movies
        }.store(in: &cancellables)
        
        viewModel.$genres.sink { genres in
            self.movieListView.genres = genres
        }.store(in: &cancellables)
        
        viewModel.$isDataAvailable.sink { isDataAvailable in
            if isDataAvailable {
                DispatchQueue.main.async {
                    self.movieListView.tableView.reloadData()
                }
            }
        }.store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
}
