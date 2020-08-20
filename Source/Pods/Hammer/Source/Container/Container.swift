//
//  Container.swift
//  Hammer
//
//  Created by Igor Matyushkin on 12.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public class Container<Value: Any> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    init(value: Value?) {
        self.value = value
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    public fileprivate(set) var value: Value?
    
    public var isNil: Bool {
        get {
            return self.value == nil
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
