//
//  AllContentViewController.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

class AllContentViewController: UIViewController {
    
    var allContentView: AllContentView {
        guard let unwrappedView = self.view as? AllContentView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    var viewModel: AllContenteViewModel?
    var allMovies: [GetMoviesQueryQuery.Data.Movie?]?

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
    }

    func setUI() {
        allContentView.allMovies = allMovies
        allContentView.coordinator = viewModel?.coordinator
        allContentView.nav = navigationController

    }

}
