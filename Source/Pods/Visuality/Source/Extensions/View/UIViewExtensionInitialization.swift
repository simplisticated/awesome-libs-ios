//
//  UIViewExtensionInitialization.swift
//  Visuality
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    // MARK: Public class methods
    
    /**
     Creates new instance of view.
     
     - Parameters:
         - nibQuery: Nib query.
         - bundleQuery: Bundle query.
     
     - returns: View from specified location.
     */
    public class func from(nib: NibQuery, inBundle bundle: BundleQuery) -> Self {
        let initializer = ViewInitializer(viewClass: self)
        return initializer.view(fromNib: nib, locatedInBundle: bundle)
    }
    
    // MARK: Private class methods
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
}
