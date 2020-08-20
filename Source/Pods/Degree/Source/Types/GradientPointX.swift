//
//  GradientPointX.swift
//  Degree
//
//  Created by Igor Matyushkin on 02.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum GradientPointX {
    case left
    case center
    case right
    case custom(value: Float)
}

public extension GradientPointX {
    
    var floatValue: Float {
        get {
            switch self {
            case .left:
                return 0.0
            case .center:
                return 0.5
            case .right:
                return 1.0
            case .custom(let value):
                return value
            }
        }
    }
    
}
