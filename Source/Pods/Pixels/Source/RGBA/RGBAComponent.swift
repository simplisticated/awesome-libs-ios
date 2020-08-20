//
//  RGBAComponent.swift
//  Pixels
//
//  Created by Igor Matyushkin on 05.06.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import UIKit

public class RGBAComponent {
    
    // MARK: Class variables & properties
    
    public static let minimumIntegerValue: Int = 0
    
    public static let maximumIntegerValue: Int = 255
    
    public static let minimumCGFloatValue: CGFloat = 0.0
    
    public static let maximumCGFloatValue: CGFloat = 1.0
    
    // MARK: Public class methods
    
    public class func componentWithMinimumValue() -> Self {
        return self.init(integerValue: self.minimumIntegerValue)
    }
    
    public class func componentWithMaximumValue() -> Self {
        return self.init(integerValue: self.maximumIntegerValue)
    }
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    required public init(integerValue: Int) {
        // Assertions for integer value
        
        assert(integerValue >= RGBAComponent.minimumIntegerValue, "Integer value should be more than or equal to minimum integer value")
        assert(integerValue <= RGBAComponent.maximumIntegerValue, "Integer value should be less than or equal to maximum integer value")
        
        // Initialize integer value
        
        self.integerValue = integerValue
        
        // Initialize CGFloat value
        
        self.cgFloatValue = CGFloat(integerValue) * RGBAComponent.maximumCGFloatValue / CGFloat(RGBAComponent.maximumIntegerValue)
    }
    
    required public init(cgFloatValue: CGFloat) {
        // Assertions for CGFloat value
        
        assert(cgFloatValue >= RGBAComponent.minimumCGFloatValue, "cgFloat value should be more than or equal to minimum CGFloat value")
        assert(cgFloatValue <= RGBAComponent.maximumCGFloatValue, "cgFloat value should be less than or equal to maximum CGFloat value")
        
        // Initialize integer value
        
        self.integerValue = Int(cgFloatValue * CGFloat(RGBAComponent.maximumIntegerValue) / RGBAComponent.maximumCGFloatValue)
        
        // Initialize CGFloat value
        
        self.cgFloatValue = cgFloatValue
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    public fileprivate(set) var integerValue: Int
    
    public fileprivate(set) var cgFloatValue: CGFloat
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
