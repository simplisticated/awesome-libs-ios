//
//  NSObjectProtocolExtensionObjectManagerBridge.swift
//  Hammer
//
//  Created by Igor Matyushkin on 01.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension NSObjectProtocol {
    
    public var hmr: ObjectManager<Self> {
        get {
            return ObjectManager(object: self)
        }
    }
    
    public var 🔨: ObjectManager<Self> {
        get {
            return ObjectManager(object: self)
        }
    }
    
}
