//
//  GradientExtensionConstructors.swift
//  Degree
//
//  Created by Igor Matyushkin on 17.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension Gradient {
    
    public static var make: Builder {
        get {
            return Builder()
        }
    }
    
    public static var makeSmooth: SmoothBuilder {
        get {
            return SmoothBuilder()
        }
    }
    
}
