//
//  NSObjectProtocolExtensionClassManagerBridge.swift
//  Hammer
//
//  Created by Igor Matyushkin on 01.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension NSObjectProtocol {
    
    public static var hmr: ClassManager<Self> {
        get {
            return ClassManager(type: self)
        }
    }
    
    public static var 🔨: ClassManager<Self> {
        get {
            return ClassManager(type: self)
        }
    }
    
}
