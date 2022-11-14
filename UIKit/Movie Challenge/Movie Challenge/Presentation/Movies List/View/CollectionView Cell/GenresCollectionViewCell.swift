//
//  GenresCollectionViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/13/22.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    private let genrelabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let genresBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .orange
       return view
    }()
    
    override func layoutIfNeeded() {
        setupSubviews()
    }
}

extension GenresCollectionViewCell: ViewSetupProtocol {
    func configureSubviews() {
        genresBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(genresBackgroundView)
        
        genrelabel.translatesAutoresizingMaskIntoConstraints = false
        genresBackgroundView.addSubview(genrelabel)
        
    }
    
    func configureConstraints() {
        genresBackgroundView.anchor(
            top: self.topAnchor, paddingTop: 10,
            left: self.leftAnchor,
            width: 100, height: 160
        )
        genrelabel.center(
            centerX: genresBackgroundView.centerXAnchor,
            centerY: centerYAnchor
        )
       
    }
    
    func fillCellWith(genre: String) {
        genrelabel.text = genre
    }
}
