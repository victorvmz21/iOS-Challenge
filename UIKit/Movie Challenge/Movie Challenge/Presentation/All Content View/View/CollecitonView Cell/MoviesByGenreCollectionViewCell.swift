//
//  MoviesByGenreCollectionViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//


import UIKit
import Apollo

class MoviesByGenreCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .black.withAlphaComponent(0.6)
        label.layer.borderColor =  UIColor.white.cgColor
        label.layer.borderWidth = 1
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

extension MoviesByGenreCollectionViewCell: ViewSetupProtocol {
    func configureSubviews() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(posterImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.addSubview(rateLabel)
    }
    
    func configureConstraints() {
        
        posterImageView.anchor(
            top: self.topAnchor, paddingTop: 10,
            left: self.leftAnchor,
            width: 100, height: 160
        )
        
        titleLabel.anchor(
            top: posterImageView.bottomAnchor, paddingTop: 4,
            left: posterImageView.leftAnchor,
            right: posterImageView.rightAnchor
        )
        
        rateLabel.anchor(
            top: posterImageView.topAnchor, paddingTop: 10,
            right: posterImageView.rightAnchor, paddingRight: -6
        )
    }
    
    func fillCellWith(movie: GetMoviesByGenresQuery.Data.Movie?) {
        posterImageView.loadImageFrom(url: movie?.posterPath ?? "")
        titleLabel.text = movie?.title ?? "title not available"
        rateLabel.text = " \(movie?.voteAverage ?? 0.0) "
        
    }
}
