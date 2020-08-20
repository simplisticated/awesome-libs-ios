//
//  ClassFormatter.swift
//  Visuality
//
//  Created by Igor Matyushkin on 28.05.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ClassFormatter<Class: NSObject> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    init(type: Class.Type) {
        self.type = type
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var type: Class.Type
    
    // MARK: Public object methods
    
    public func classNameWithNamespace() -> String {
        return NSStringFromClass(self.type)
    }
    
    public func classNameWithoutNamespace() -> String {
        let nameIncludingPath = NSStringFromClass(self.type)
        let segments = nameIncludingPath.components(separatedBy: ".")
        let nameWithoutPath = segments.last ?? ""
        return nameWithoutPath
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}
