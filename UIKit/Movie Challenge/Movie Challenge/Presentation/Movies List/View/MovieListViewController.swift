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
         
        bindViewModel()
        getData()
    }
    
    func bindViewModel() {
        viewModel?.$screenTitle.sink(receiveValue: { title in
            self.title = title
        }).store(in: &cancellables)
    }
}
