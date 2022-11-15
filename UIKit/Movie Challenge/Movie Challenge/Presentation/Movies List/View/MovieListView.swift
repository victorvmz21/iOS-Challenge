//
//  MovieListView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit
import Apollo

class MovieListView: UIView {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(
            TopFiveMovieCell.self,
            forCellReuseIdentifier: TopFiveMovieCell.identifier
        )
        
        tableView.register(
            MoviesTableViewCell.self,
            forCellReuseIdentifier: MoviesTableViewCell.identifier
        )
        
        tableView.register(
            GenresTableViewCell.self,
            forCellReuseIdentifier: GenresTableViewCell.identifier
        )
    
        return tableView
    }()
    
    var movies: [GetMoviesQueryQuery.Data.Movie?]?
    var nav: UINavigationController?
    var topFiveMovies: [TopMoviesQueryQuery.Data.Movie?]?
    var genres: [String]?
    var coordinator: CoordinatorProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MovieListView: ViewSetupProtocol {
    func configureSubviews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
    }
    
    func configureConstraints() {
        tableView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor
        )
    }
}
extension MovieListView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setTableViewViewCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Top 5 Movies"
        } else if section == 1 {
            return "Genres"
        } else {
            return "All Movies"
        }
    }
    
    func setTableViewViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopFiveMovieCell.identifier, for: indexPath) as? TopFiveMovieCell else {
                return UITableViewCell()
            }
            guard let topFiveMovies = topFiveMovies else { return UITableViewCell() }
            guard let nav = nav else { return UITableViewCell() }
            guard let coordinator = coordinator else { return UITableViewCell() }
            
            cell.layoutIfNeeded()
            cell.setCellWith(values: topFiveMovies, nav, coordinator: coordinator)
            
            return cell
            
        } else if indexPath.section == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GenresTableViewCell.identifier, for: indexPath) as? GenresTableViewCell else {
                return UITableViewCell()
            }
            guard let genres = genres else { return UITableViewCell() }
            cell.layoutIfNeeded()
            cell.genres = genres
            return cell
            
        } else if indexPath.section == 2 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
                return UITableViewCell()
            }
            guard let allMovies = movies else { return UITableViewCell() }
            cell.layoutIfNeeded()
            cell.allMovies = allMovies
            return cell
            
        }
        return UITableViewCell()
    }
    
}
