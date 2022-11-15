//
//  AllContenteViewModel.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/15/22.
//

import UIKit

class AllContenteViewModel: ObservableObject {
    
    let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func goToDetailScreen(movieID: Int, nav: UINavigationController) {
        coordinator.toDetailScreen(movieID: movieID, nav: nav)
    }
}
