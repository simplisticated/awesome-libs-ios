//
//  Gradient.swift
//  Degree
//
//  Created by Igor Matyushkin on 21.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public struct Gradient {
    var startPoint: GradientPoint
    var endPoint: GradientPoint
    var steps: [GradientStep]
    
    internal init(startPoint: GradientPoint, endPoint: GradientPoint, steps: [GradientStep]) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.steps = steps
    }
}
