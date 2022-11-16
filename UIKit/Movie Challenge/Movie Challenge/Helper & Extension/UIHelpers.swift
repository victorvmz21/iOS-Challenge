//
//  ViewSetupProtocol.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

protocol ViewSetupProtocol {
    func configureSubviews()
    func configureConstraints()
    func setupSubviews()
}

extension ViewSetupProtocol {
    func setupSubviews() {
        configureSubviews()
        configureConstraints()
    }
}
