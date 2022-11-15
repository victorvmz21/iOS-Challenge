//
//  MoviesTableViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/13/22.
//

import UIKit

class TopFiveMovieCell: UITableViewCell {
    
    var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = .zero
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            TopFiveMovieCollectionViewCell.self,
            forCellWithReuseIdentifier: TopFiveMovieCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    override func layoutIfNeeded() {
        setupSubviews()
    }

    var coordinator: CoordinatorProtocol?
    var nav: UINavigationController?
    var topFiveMovies: [TopMoviesQueryQuery.Data.Movie?]? {
        didSet {
            if topFiveMovies != nil {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func setCellWith(values movies:[TopMoviesQueryQuery.Data.Movie?]?, _ nav: UINavigationController, coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        self.nav = nav
        self.topFiveMovies = movies
    }
    
}

extension TopFiveMovieCell: ViewSetupProtocol {
    func configureSubviews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.addSubview(collectionView)
    }
    
    func configureConstraints() {
        collectionView.anchor(
            top: self.topAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor, paddingRight: -10,
            height: 200
        )
    }
}

extension TopFiveMovieCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topFiveMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopFiveMovieCollectionViewCell.identifier, for: indexPath) as? TopFiveMovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let topFiveMovies = topFiveMovies else { return UICollectionViewCell() }
            cell.layoutIfNeeded()
            cell.fillCellWith(movie: topFiveMovies[indexPath.row])

            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: -20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieID = topFiveMovies?[indexPath.row]?.id else { return }
        guard let nav = nav else { return }
        coordinator?.toDetailScreen(movieID: movieID, nav: nav)
    }

}
