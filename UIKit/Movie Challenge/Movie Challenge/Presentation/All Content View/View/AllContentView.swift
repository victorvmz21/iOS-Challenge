//
//  AllContentView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

class AllContentView: UIView {

    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
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
    
    var coordinator: CoordinatorProtocol?
    var nav: UINavigationController?
    var moviesByGenre: [Movie]?
    var allMovies: [Movie]? {
        didSet {
            if allMovies != nil {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension AllContentView: ViewSetupProtocol {
    func configureSubviews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
    }
    
    func configureConstraints() {
        collectionView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor ,
            right: self.rightAnchor
        )
    }
    
}

extension AllContentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setNumberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       return setCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       setSelectedItem(indexPath: indexPath)
    }
    
    func setSelectedItem(indexPath: IndexPath) {
        guard let nav = nav else { return }
       
        if allMovies != nil {
            guard let movieID = allMovies?[indexPath.row].id else { return }
            coordinator?.toDetailScreen(movieID: movieID, nav: nav)
        } else {
            guard let movieID = moviesByGenre?[indexPath.row].id else { return }
            coordinator?.toDetailScreen(movieID: movieID, nav: nav)
        }
    }
    
    func setCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if allMovies != nil {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            guard let allMovies = allMovies else { return UICollectionViewCell() }
            cell.layoutIfNeeded()
            cell.fillCellWith(movie: allMovies[indexPath.row])

            return cell
            
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            guard let moviesByGenre = moviesByGenre else { return UICollectionViewCell() }
            cell.layoutIfNeeded()
            cell.fillCellWith(movie: moviesByGenre[indexPath.row])
            
            return cell
        }
    }
    
    func setNumberOfItemsInSection() -> Int {
        if allMovies != nil {
            return allMovies?.count ?? 0
        } else {
            print( moviesByGenre?.count ?? 0)
            return moviesByGenre?.count ?? 0
        }
    }

}
