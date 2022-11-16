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
    lazy var viewControllerFactory: ViewControllerFactoryProtocol = ViewControllerFactory()
    lazy var viewModelFactory: ViewModelFactoryProtocol = ViewModelFactory()
    lazy var repositoryFactory: RepositoryFactoryProtocol = RepositoryFactory()
    lazy var useCaseFactory: UseCaseFactoryProtocol = UseCaseFactory()
    lazy var coordinatorFactory: CoordinatorFactoryProtocol = CoordinatorFactory()
    
}
