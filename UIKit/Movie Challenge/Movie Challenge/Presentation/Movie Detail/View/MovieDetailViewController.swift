//
//  MovieDetailViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit
import Combine

class MovieDetailViewController: UIViewController {
    
    var viewModel: MoviesDetailViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    var movieDetailView: MovieDetailView {
        guard let unwrappedView = self.view as? MovieDetailView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    var movieID: Int?
    
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
        getData()
        bindViewModel()
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
            self.movieDetailView.titleLabel.text = movie?.title ?? "Title Not available"
            self.movieDetailView.thumbImageView.loadImageFrom(url: movie?.posterPath ?? "")
            self.movieDetailView.posterImageView.loadImageFrom(url: movie?.posterPath ?? "")
            self.movieDetailView.rateLabel.text = "rate: \(movie?.voteAverage ?? 0) ⭐️"
            self.movieDetailView.directorNameLabel.text = movie?.director.name ?? "Unknown"
            self.movieDetailView.overviewTextView.text = movie?.overview ?? "Overview not available"
            self.movieDetailView.cast = movie?.cast
            self.movieDetailView.genres = movie?.genres
        }.store(in: &cancellables)
    }
    
    func getData() {
        guard let movieID = movieID else { return }
        viewModel.fetchMovieDetails(movieID: movieID)
    }

}
