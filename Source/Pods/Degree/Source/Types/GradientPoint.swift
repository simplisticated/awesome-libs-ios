//
//  GradientPoint.swift
//  Degree
//
//  Created by Igor Matyushkin on 21.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public struct GradientPoint {
    var x: Float
    var y: Float
    
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    public init(x: GradientPointX, y: GradientPointY) {
        self.x = x.floatValue
        self.y = y.floatValue
    }
}

internal extension GradientPoint {
    
    internal var cgPoint: CGPoint {
        get {
            return CGPoint(
                x: CGFloat(self.x),
                y: CGFloat(self.y)
            )
        }
    }
    
}
