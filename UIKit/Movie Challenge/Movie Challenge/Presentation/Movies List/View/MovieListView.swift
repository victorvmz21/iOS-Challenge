//
//  MovieListView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit
import Apollo

class MovieListView: UIView {
    
    var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()
    
    var movies: [GetMoviesQueryQuery.Data.Movie?]?
    
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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
    }
    
    func configureConstraints() {
        collectionView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor
        )
        
    }
}

extension MovieListView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        guard let movies = movies else { return UICollectionViewCell() }
        cell.fillCellWith(movie: movies[indexPath.row])
        
        return cell
    }
    

}
