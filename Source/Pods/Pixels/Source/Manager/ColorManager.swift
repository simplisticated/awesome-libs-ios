//
//  ColorManager.swift
//  Pixels
//
//  Created by Igor Matyushkin on 05.11.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ColorManager {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(color: UIColor) {
        // Initialize color
        
        self._color = color
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var _color: UIColor!
    
    public var color: UIColor {
        get {
            return self._color
        }
    }
    
    public var rgba: RGBAColor {
        get {
            return RGBAColor.from(color: self.color)
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
