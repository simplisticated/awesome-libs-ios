//
//  GradientPointY.swift
//  Degree
//
//  Created by Igor Matyushkin on 17.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum GradientPointY {
    case top
    case center
    case bottom
    case custom(value: Float)
}

public extension GradientPointY {
    
    var floatValue: Float {
        get {
            switch self {
            case .top:
                return 0.0
            case .center:
                return 0.5
            case .bottom:
                return 1.0
            case .custom(let value):
                return value
            }
        }
    }
    
}
