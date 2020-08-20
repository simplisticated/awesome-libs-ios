//
//  ViewInitializer.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ViewInitializer<View: UIView> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(viewClass: View.Type) {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    /**
     Creates new instance of view.
     
     - Parameters:
         - nibQuery: Nib query.
         - bundleQuery: Bundle query.
     
     - returns: View from specified location.
     */
    public func view(fromNib nibQuery: NibQuery, locatedInBundle bundleQuery: BundleQuery) -> View {
        // Obtain bundle
        
        var nibBundle: Bundle!
        
        switch bundleQuery {
        case .main:
            nibBundle = .main
            break
        case let .byInstance(bundle):
            nibBundle = bundle
            break
        case let .byIdentifier(identifier):
            nibBundle = Bundle(identifier: identifier)
            break
        }
        
        let bundleOrMain = nibBundle ?? .main
        
        // Obtain nib name
        
        var nibName: String?
        
        switch nibQuery {
        case let .byNibName(name):
            nibName = name
            break
        case .byClassName:
            nibName = ClassFormatter(type: View.self).classNameWithoutNamespace()
            break
        case .byClassNameWithSuffix(let suffix):
            nibName = String(
                format: "%@%@",
                ClassFormatter(type: View.self).classNameWithoutNamespace(),
                suffix.string
            )
            break
        case .none:
            // Do nothing
            break
        }
        
        // Check whether nib exists in specified bundle
        
        let nibExists = nibName == nil ? false : NibFinder().nib(withName: nibName!, existsInBundle: bundleOrMain)
        
        // Obtain result view
        
        var resultView: View?
        
        if nibExists {
            resultView = NibLoader().loadView(ofType: View.self, fromNibWithName: nibName!, locatedInBundle: bundleOrMain)
        }
        
        if resultView == nil {
            resultView = View.init()
        }
        
        // Return result
        
        return resultView!
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
