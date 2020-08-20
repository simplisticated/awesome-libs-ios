//
//  UIViewControllerExtensionInitialization.swift
//  Visuality
//
//  Created by Igor Matyushkin on 23.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK: Public class methods
    
    /**
     Creates new instance of view controller.
     
     - Parameters:
         - nib: Nib query.
         - bundle: Bundle query.
         - loadView: Defines whether view controller's view should be loaded immediately. By default, it's `false`.
     
     - returns: View controller from specified location.
     */
    public class func from(nib: NibQuery, inBundle bundle: BundleQuery, loadView: Bool = false) -> Self {
        let initializer = ViewControllerInitializer(viewControllerClass: self)
        return initializer.viewController(fromNib: nib, locatedInBundle: bundle, loadView: loadView)
    }
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
