//
//  MovieListView.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import UIKit

class MovieListView: UIView {
    
    let tableView = UITableView()
    
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
    }
    
    func configureConstraints() {
        tableView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor
        )
        
    }
}
