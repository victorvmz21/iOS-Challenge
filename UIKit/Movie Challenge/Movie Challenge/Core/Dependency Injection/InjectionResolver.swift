//
//  InjectionResolver.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

class InjectionResolver {
    
    static let shared: InjectionResolver = InjectionResolver()
    
    //MARK: - Factories
    lazy var viewModelFactory: ViewModelFactoryProtocol = ViewModelFactory()
}
