//
//  Injected.swift
//  Movie Challenge
//
//  Created by Victor Monteiro on 11/12/22.
//

import Foundation

import CoreText
import Foundation

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T
    
    init(_ keyPath: KeyPath<InjectionResolver, T>) {
        self.wrappedValue = InjectionResolver.shared[keyPath: keyPath]
    }
}
