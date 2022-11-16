//
//  CastCollectionViewCell.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    let castNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        setupSubviews()
    }
}

extension CastCollectionViewCell: ViewSetupProtocol {
    func configureSubviews() {
        castNameLabel.translatesAutoresizingMaskIntoConstraints = false
        castNameLabel.backgroundColor = .orange
        castNameLabel.textColor = .white
        castNameLabel.layer.cornerRadius = castNameLabel.frame.height / 2
        castNameLabel.layer.masksToBounds = true
        addSubview(castNameLabel)
    }
    
    func configureConstraints() {
        castNameLabel.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor,
            height: 40
        )
    }
    
    func fillCellWith(text: String) {
        self.castNameLabel.text = text
    }
}
