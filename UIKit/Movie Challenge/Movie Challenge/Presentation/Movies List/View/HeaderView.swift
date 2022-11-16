//
//  HeaderView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

class HeaderView: UIView {
    
    let headerSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    var movies: [GetMoviesQueryQuery.Data.Movie?]?
    var coordinator: CoordinatorProtocol?
    var nav: UINavigationController?
    
    override func layoutIfNeeded() {
        setupSubviews()
    }
    
    func configureHeader(_ headerTitle: String, movies: [GetMoviesQueryQuery.Data.Movie?]?, coordinator: CoordinatorProtocol?, nav: UINavigationController?) {
        headerSectionTitleLabel.text = headerTitle
        self.movies = movies
        self.coordinator = coordinator
        self.nav = nav
        viewAllButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        guard let movies = movies else { return }
        guard let nav = nav else { return }
        coordinator?.toAllContentScreen(allMovies: movies, genreIdentifier: nil, nav: nav)
    }
    
}

extension HeaderView: ViewSetupProtocol {
    func configureSubviews() {
        headerSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerSectionTitleLabel)
        
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewAllButton)
       
    }
    
    func configureConstraints() {
        viewAllButton.anchor(
            top: headerSectionTitleLabel.topAnchor, paddingTop: -4,
            right: self.rightAnchor, paddingRight: -20
        )
        
        headerSectionTitleLabel.anchor(
            top: self.topAnchor,
            left: self.leftAnchor, paddingLeft: 20
        )

    }
}

