//
//  AllContentViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit
import Combine

class AllContentViewController: UIViewController {
    
    var viewModel: AllContenteViewModel
    var genre: String?
    var allMovies: [GetMoviesQueryQuery.Data.Movie?]?
    private var cancellables: Set<AnyCancellable> = []
    
    var allContentView: AllContentView {
        guard let unwrappedView = self.view as? AllContentView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: AllContenteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AllContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    func bindViewModel() {
        viewModel.$moviesByGenre.sink { movies in
            if movies != nil {
                self.allContentView.moviesByGenre = movies
                DispatchQueue.main.async {
                    self.allContentView.collectionView.reloadData()
                }
            }
        }.store(in: &cancellables)
    }
    
    func getData() {
        guard let genre = genre else { return }
        viewModel.fetchMoviesByGenre(genre: genre)
    }
    
    func setUI() {
        self.title = genre == nil ? "All Movies" : genre
        allContentView.allMovies = allMovies
        allContentView.coordinator = viewModel.coordinator
        allContentView.nav = navigationController
        setNavigationItem()
    }
    
    func setNavigationItem() {
        let buttonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            menu: makeContextMenu()
        )
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    func makeContextMenu() -> UIMenu {

        let filterByName = UIAction(title: "Filter by name", image: nil) { action in
            if self.genre != nil {
                self.viewModel.moviesByGenre = self.viewModel.moviesByGenre?.sorted(by: {$0?.title ?? "" > $1?.title ?? ""})
            } else {
                self.allContentView.allMovies =  self.allMovies?.sorted(by: {$0?.title ?? "" > $1?.title ?? ""})
            }
        }
        
        let filterByPopularity = UIAction(title: "Filter by popularity", image: nil) { action in
            if self.genre != nil {
                self.viewModel.moviesByGenre = self.viewModel.moviesByGenre?.sorted(by: {$0?.voteAverage ?? 0 > $1?.voteAverage ?? 0})
            } else {
                self.allContentView.allMovies =  self.allMovies?.sorted(by: {$0?.voteAverage ?? 0 > $1?.voteAverage ?? 0})
            }
        }
        
        return UIMenu(options: .singleSelection, children: [filterByName, filterByPopularity])
    }
}
