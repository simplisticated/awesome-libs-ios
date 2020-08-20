//
//  ViewControllerInitializer.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ViewControllerInitializer<ViewController: UIViewController> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(viewControllerClass: ViewController.Type) {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    /**
     Creates new instance of view controller.
     
     - Parameters:
         - nibQuery: Nib query.
         - bundleQuery: Bundle query.
         - loadView: Defines whether view controller's view should be loaded immediately.
     
     - returns: View controller from specified location.
     */
    public func viewController(fromNib nibQuery: NibQuery, locatedInBundle bundleQuery: BundleQuery, loadView: Bool) -> ViewController {
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
            nibName = ClassFormatter(type: ViewController.self).classNameWithoutNamespace()
            break
        case .byClassNameWithSuffix(let suffix):
            nibName = String(
                format: "%@%@",
                ClassFormatter(type: ViewController.self).classNameWithoutNamespace(),
                suffix.string
            )
            break
        case .none:
            // Do nothing
            break
        }
        
        // Check whether nib exists in specified bundle
        
        let nibExists = nibName == nil ? false : NibFinder().nib(withName: nibName!, existsInBundle: bundleOrMain)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName!, bundle: bundleOrMain) : ViewController.init()
        
        // Load view if needed
        
        if loadView {
            let _ = resultViewController.view
        }
        
        // Return result
        
        return resultViewController
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
