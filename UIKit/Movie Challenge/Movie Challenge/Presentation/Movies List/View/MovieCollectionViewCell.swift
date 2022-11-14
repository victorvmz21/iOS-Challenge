//
//  MovieCollectionViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/13/22.
//

import UIKit
import Apollo

class MovieCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func layoutIfNeeded() {
        setupSubviews()
    }
    
}

extension MovieCollectionViewCell: ViewSetupProtocol {
    func configureSubviews() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(posterImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rateLabel)
    }
    
    func configureConstraints() {
        posterImageView.anchor(
            top: self.topAnchor, paddingTop: 10,
            left: self.leftAnchor, width: 90, height: 130)
    }
    
    func fillCellWith(movie: GetMoviesQueryQuery.Data.Movie?) {
        posterImageView.loadImageFrom(url: movie?.posterPath ?? "")
    }
}
