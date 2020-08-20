//
//  NibLoader.swift
//  Visuality
//
//  Created by Igor Matyushkin on 28.05.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class NibLoader {
    
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
     Loads view with specified class from nib with specified name.
     
     - Parameters:
        - viewType: Class of view to load from nib.
        - nibName: Name of nib file to load view from.
        - bundle: Bundle.
     
     - returns: View with specified class loaded from nib with specified name.
     */
    internal func loadView<View: UIView>(ofType viewType: View.Type, fromNibWithName nibName: String, locatedInBundle bundle: Bundle) -> View? {
        // Check for existance of nib
        
        let nibExists = NibFinder().nib(withName: nibName, existsInBundle: bundle)
        
        if (!nibExists) {
            return nil
        }
        
        // Obtain result view
        
        let requiredClassName = ClassFormatter(type: viewType).classNameWithNamespace()
        let topLevelObjectsFromNib = bundle.loadNibNamed(nibName, owner: nil, options: nil) ?? [AnyObject]()
        
        let filteredTopLevelObjectsFromNib = topLevelObjectsFromNib.filter { (evaluatedObject) -> Bool in
            let evaluatedObjectClass = (evaluatedObject as! NSObject).classForCoder as! NSObject.Type
            let evaluatedObjectClassName = ClassFormatter(type: evaluatedObjectClass).classNameWithNamespace()
            let classNameOfEvaluatedObjectIsEqualToRequiredClassName = evaluatedObjectClassName == requiredClassName
            return classNameOfEvaluatedObjectIsEqualToRequiredClassName
        }
        
        let resultView = filteredTopLevelObjectsFromNib.first as? View
        
        // Return result view
        
        return resultView
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}
