//
//  MovieDetailViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit
import Combine

class MovieDetailViewController: UIViewController {
    
    var movieID: Int?
    var viewModel: MoviesDetailViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    var movieDetailView: MovieDetailView {
        guard let unwrappedView = self.view as? MovieDetailView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: MoviesDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MovieDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUI()
    }
    
    func setUI() {
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func bindViewModel() {
        viewModel.$movie.sink { movie in
            DispatchQueue.main.async {
                self.movieDetailView.titleLabel.text = movie?.title
                self.movieDetailView.thumbImageView.loadImageFrom(url: movie?.posterPath ?? "")
                self.movieDetailView.posterImageView.loadImageFrom(url: movie?.posterPath ?? "")
                self.movieDetailView.rateLabel.text = "rate: \(movie?.voteAverage ?? 0) ⭐️"
                self.movieDetailView.directorNameLabel.text = movie?.director?.name
                self.movieDetailView.overviewTextView.text = movie?.overview
                self.movieDetailView.cast = movie?.cast
                self.movieDetailView.genres = movie?.genres
            }
        }.store(in: &cancellables)
        
        viewModel.$errorMessage.sink { message in
            if let message = message {
                self.displayErrorAlert(message: message)
            }
        }.store(in: &cancellables)
    }
    
    func getData() {
        guard let movieID = movieID else { return }
        viewModel.fetchMovieDetails(movieID: movieID)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }

}
