//
//  MovieDetailView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit

class MovieDetailView: UIView {
    
    let detailBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
       return view
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let posterOverLayView: UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.7)
       return view
    }()
    
    let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    let overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Overview"
        return label
    }()
    
    let overviewTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .gray
        textView.isScrollEnabled = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    
    let overviewTextViewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    let directorTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.text = "Director"
        return label
    }()
    
    let directorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .label
        return label
    }()
    
    let castTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Cast"
        return label
    }()
    
    let castCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = .zero
        
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            CastCollectionViewCell.self,
            forCellWithReuseIdentifier: CastCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    let genresTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Genres"
        return label
    }()
    
    let genresCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = .zero
        
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            CastCollectionViewCell.self,
            forCellWithReuseIdentifier: CastCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    var cast: [Cast]? {
        didSet {
            DispatchQueue.main.async {
                self.castCollectionView.reloadData()
            }
        }
    }
    
    var genres: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.genresCollectionView.reloadData()
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

extension MovieDetailView: ViewSetupProtocol {
    func configureSubviews() {
        
        detailBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(detailBackgroundView)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(posterImageView)
        
        posterOverLayView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.addSubview(posterOverLayView)
        
        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(thumbImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(titleLabel)
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(genreLabel)
        
        overviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(overviewTitleLabel)
        
        overviewTextView.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(overviewTextView)
        
        directorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(directorTitleLabel)
        
        directorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(directorNameLabel)
        
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(rateLabel)
        
        castTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(castTitleLabel)
        
        castCollectionView.translatesAutoresizingMaskIntoConstraints = false
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        detailBackgroundView.addSubview(castCollectionView)
        
        genresTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailBackgroundView.addSubview(genresTitleLabel)
        
        genresCollectionView.translatesAutoresizingMaskIntoConstraints = false
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        detailBackgroundView.addSubview(genresCollectionView)
        
    }
    
    func configureConstraints() {
        detailBackgroundView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor
        )
        
        posterImageView.anchor(
            top: self.topAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor,
            height: 160
        )
        
        posterOverLayView.anchor(
            top: posterImageView.topAnchor,
            bottom: posterImageView.bottomAnchor,
            left: posterImageView.leftAnchor,
            right: posterImageView.rightAnchor
        )
        
        thumbImageView.anchor(
            top: posterImageView.bottomAnchor, paddingTop: -50,
            left: self.leftAnchor, paddingLeft: 20,
           width: 100, height: 160
        )
        
        titleLabel.anchor(
            top: posterImageView.bottomAnchor, paddingTop: 10,
            left: thumbImageView.rightAnchor, paddingLeft: 20,
            right: self.rightAnchor, paddingRight: 20
        )
        
        rateLabel.anchor(
            top: titleLabel.bottomAnchor, paddingTop: 8,
            left: titleLabel.leftAnchor
        )
        
        overviewTitleLabel.anchor(
            top: self.thumbImageView.bottomAnchor, paddingTop: 20,
            left: self.thumbImageView.leftAnchor
        )
        
        overviewTextView.anchor(
            top: self.overviewTitleLabel.bottomAnchor, paddingTop: 10,
            left: self.overviewTitleLabel.leftAnchor,
            right: self.rightAnchor, paddingRight: -20,
            height: 160
        )
        
        directorTitleLabel.anchor(
            top: self.rateLabel.bottomAnchor, paddingTop: 10,
            left: self.rateLabel.leftAnchor
        )
        
        directorNameLabel.anchor(
            top: self.directorTitleLabel.bottomAnchor, paddingTop: 6,
            left: self.directorTitleLabel.leftAnchor
        )
        
        castTitleLabel.anchor(
            top: self.overviewTextView.bottomAnchor, paddingTop: 10,
            left: self.overviewTextView.leftAnchor
        )
        
        castCollectionView.anchor(
            top: castTitleLabel.bottomAnchor, paddingTop: 10,
            left: castTitleLabel.leftAnchor,
            right: self.rightAnchor, paddingRight: -20,
            width: UIScreen.main.bounds.width, height: 40
        )
        
        genresTitleLabel.anchor(
            top: self.castCollectionView.bottomAnchor, paddingTop: 20,
            left: self.castCollectionView.leftAnchor
        )
        
        genresCollectionView.anchor(
            top: genresTitleLabel.bottomAnchor, paddingTop: 10,
            left: genresTitleLabel.leftAnchor,
            right: self.rightAnchor, paddingRight: -20,
            width: UIScreen.main.bounds.width, height: 40
        )
        
    }
}

extension MovieDetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setNumberOfItemsInSection(collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setCellForRow(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -20)
    }
    
    func setNumberOfItemsInSection(collectionView: UICollectionView) -> Int {
        if collectionView == castCollectionView {
            return cast?.count ?? 0
        } else {
            return genres?.count ?? 0
        }
    }
    
    func setCellForRow(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == castCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let cast = cast else { return UICollectionViewCell() }
            cell.layoutIfNeeded()
            cell.fillCellWith(castName: cast[indexPath.row].name)

            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let genres = genres else { return UICollectionViewCell() }
            cell.layoutIfNeeded()
            cell.fillCellWith(castName: genres[indexPath.row])

            return cell
        }
    }
}
