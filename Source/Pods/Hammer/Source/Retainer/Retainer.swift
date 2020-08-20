//
//  Retainer.swift
//  Hammer
//
//  Created by Igor Matyushkin on 30.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class Retainer {
    
    // MARK: Class variables & properties
    
    public static var shared = {
        return Retainer()
    }()
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    fileprivate init() {
        self.objects = []
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var objects: [Object]!
    
    // MARK: Public object methods
    
    public func retain(_ object: Object) {
        self.objects.append(object)
    }
    
    public func free(_ object: Object) {
        let objectIndex = self.objects.index { (objectFromStore) -> Bool in
            return object === objectFromStore
        }
        
        if let `objectIndex` = objectIndex {
            self.objects.remove(at: objectIndex)
        }
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}

extension Retainer {
    
    public typealias Object = NSObjectProtocol
    
}
