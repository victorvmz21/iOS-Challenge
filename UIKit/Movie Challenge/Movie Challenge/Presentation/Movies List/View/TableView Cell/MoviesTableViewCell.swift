//
//  MoviesTableViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//
import UIKit

class MoviesTableViewCell: UITableViewCell {
    
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
            MovieCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    override func layoutIfNeeded() {
        setupSubviews()
    }

    var coordinator: CoordinatorProtocol?
    var nav: UINavigationController?
    var allMovies: [Movie]? {
        didSet {
            if allMovies != nil {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension MoviesTableViewCell: ViewSetupProtocol {
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
    
    func setCellWith(values movies:[Movie]?, _ nav: UINavigationController, coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        self.nav = nav
        self.allMovies = movies
    }
}

extension MoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let allMovies = allMovies else { return UICollectionViewCell() }
        cell.layoutIfNeeded()
        cell.fillCellWith(movie: allMovies[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: -20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieID = allMovies?[indexPath.row].id else { return }
        guard let nav = nav else { return }
        coordinator?.toDetailScreen(movieID: movieID, nav: nav)
    }

}
