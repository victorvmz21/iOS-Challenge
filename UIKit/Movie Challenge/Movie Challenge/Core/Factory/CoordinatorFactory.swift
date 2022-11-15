//
//  CoordinatorFactory.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/14/22.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func createMainCoordinator() -> Coordinator
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func createMainCoordinator() -> Coordinator {
        return Coordinator()
    }
}
