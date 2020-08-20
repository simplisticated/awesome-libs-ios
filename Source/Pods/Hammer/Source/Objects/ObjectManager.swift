//
//  ObjectManager.swift
//  Hammer
//
//  Created by Igor Matyushkin on 01.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ObjectManager<Object: Any> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(object: Object) {
        self.object = object
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var object: Object!
    
    public var `return`: Object {
        get {
            return self.object
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}

/*
 * Conversions.
 */
public extension ObjectManager {
    
    @discardableResult
    public func use(_ closure: (_ object: Object) -> Void) -> Self {
        closure(self.object)
        return self
    }
    
    @discardableResult
    public func use<NewClass: NSObjectProtocol>(as type: NewClass.Type, _ closure: (_ object: NewClass) -> Void) -> Self {
        closure(self.object as! NewClass)
        return self
    }
    
}

/*
 * Retaining.
 */
public extension ObjectManager where Object == NSObjectProtocol {
    
    @discardableResult
    public func hold() -> Self {
        Retainer.shared.retain(self.object)
        return self
    }
    
    @discardableResult
    public func free() -> Self {
        Retainer.shared.free(self.object)
        return self
    }
    
}

/*
 * Container.
 */
public extension ObjectManager {
    
    public func wrap() -> Container<Object> {
        return Container(value: self.object)
    }
    
}
