//
//  NibFinder.swift
//  Visuality
//
//  Created by Igor Matyushkin on 28.05.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class NibFinder {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    /**
     Checks whether nib with specified name exists in bundle.
     
     - Parameters:
        - nibName: Name of nib file.
        - bundle: Bundle.
     
     - returns: True if nib exists. Otherwise, returns false.
     */
    public func nib(withName nibName: String, existsInBundle bundle: Bundle) -> Bool {
        // Obtain path for nib
        
        let pathForNib = bundle.path(forResource: nibName, ofType: "nib")
        
        // Check for existance of nib
        
        var nibExists = false
        
        if pathForNib != nil {
            let fileManager = FileManager.default
            nibExists = fileManager.fileExists(atPath: pathForNib!)
        }
        
        // Return result
        
        return nibExists
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}
