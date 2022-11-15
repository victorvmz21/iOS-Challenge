//
//  HeaderView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

protocol viewAllMoviesButtonProtocol: AnyObject {
    func viewAllMovies()
}

class HeaderView: UIView {
    
    weak var delegate: viewAllMoviesButtonProtocol?
    var vc: UIViewController?
    
    let headerSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override func layoutIfNeeded() {
        setupSubviews()
    }
    
    @objc func viewAllMoviesAction() {
        delegate?.viewAllMovies()
    }
    
}

extension HeaderView: ViewSetupProtocol {
    func configureSubviews() {
        headerSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerSectionTitleLabel)
        
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewAllButton)
        guard let vc = vc else { return }
        viewAllButton.addTarget(vc, action: #selector(viewAllMoviesAction), for: .touchUpInside)
       
    }
    
    func configureConstraints() {
        headerSectionTitleLabel.anchor(
            top: self.topAnchor,
            left: self.leftAnchor, paddingLeft: 20
        )
        
        viewAllButton.anchor(right: self.rightAnchor, paddingRight: -20)
        viewAllButton.center(centerX: headerSectionTitleLabel.centerXAnchor)

    }
}

