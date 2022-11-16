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
            MoviesTableViewCell.self,
            forCellReuseIdentifier: MoviesTableViewCell.identifier
        )
        
        tableView.register(
            GenresTableViewCell.self,
            forCellReuseIdentifier: GenresTableViewCell.identifier
        )
    
        return tableView
    }()
    
    let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search here..."
       return searchBar
    }()
    
    var movies: [Movie]?
    var topFiveMovies: [Movie]?
    var genres: [String]?
    var nav: UINavigationController?
    var vc: UIViewController?
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
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
    }
    
    func configureConstraints() {
        searchBar.anchor(
            top: self.safeAreaLayoutGuide.topAnchor,
            left: self.leftAnchor, paddingLeft: 20,
            right: self.rightAnchor, paddingRight: -20,
            height: 60
        )
        
        tableView.anchor(
            top: searchBar.topAnchor, paddingTop: 60,
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
        return section == 0 ? "Top 5 Movies" : section == 1 ? "Genres" : ""
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let view = HeaderView()
            view.layoutIfNeeded()
            view.configureHeader("All Movies", movies: movies, coordinator: coordinator, nav: nav)
            return view
        }
        return nil
    }
    
    func setTableViewViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let nav = nav else { return UITableViewCell() }
        guard let coordinator = coordinator else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
                return UITableViewCell()
            }
            guard let topFiveMovies = topFiveMovies else { return UITableViewCell() }
            cell.layoutIfNeeded()
            cell.setCellWith(values: topFiveMovies, nav, coordinator: coordinator)
            return cell
            
        } else if indexPath.section == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GenresTableViewCell.identifier, for: indexPath) as? GenresTableViewCell else {
                return UITableViewCell()
            }
            guard let genres = genres else { return UITableViewCell() }
            cell.layoutIfNeeded()
            cell.setCellWith(values: genres, nav, coordinator: coordinator)
            return cell
            
        } else if indexPath.section == 2 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
                return UITableViewCell()
            }
            guard let allMovies = movies else { return UITableViewCell() }
            cell.layoutIfNeeded()
            cell.setCellWith(values: allMovies, nav, coordinator: coordinator)
            return cell
            
        }
        return UITableViewCell()
    }
    
}

extension MovieListView {
    @objc func openAllMoviesView() {
        guard let nav = nav else { return }
        coordinator?.toAllContentScreen(allMovies: movies, genreIdentifier: nil, nav: nav)
    }
}
