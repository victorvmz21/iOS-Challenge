//
//  MovieTableViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/13/22.
//

import UIKit
import Apollo

class MovieTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
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
    
    func fillCellWith(movie: GetMoviesQueryQuery.Data.Movie?) {
        titleLabel.text = movie?.title
        genreLabel.text = movie?.genres.first ?? "genre unavailable"
        posterImageView.loadImageFrom(url: movie?.posterPath ?? "")
        rateLabel.text = "Rate: \(movie?.voteAverage ?? 0)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieTableViewCell: ViewSetupProtocol {
    func configureSubviews() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(posterImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(genreLabel)

        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rateLabel)
    }
    
    func configureConstraints() {
        posterImageView.anchor(
            top: self.topAnchor, paddingTop: 10,
            left: self.leftAnchor, paddingLeft: 40,
            width: 100, height: 160
        )
        
        titleLabel.anchor(
            top: posterImageView.topAnchor,
            left: posterImageView.rightAnchor, paddingLeft: 12
        )

        genreLabel.anchor(
            top: titleLabel.bottomAnchor, paddingTop: 6,
            left: titleLabel.leftAnchor
        )

        rateLabel.anchor(
            top: genreLabel.bottomAnchor, paddingTop: 6,
            left: genreLabel.leftAnchor
        )
    }
}
