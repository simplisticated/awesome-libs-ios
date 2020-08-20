//
//  GradientStep.swift
//  Degree
//
//  Created by Igor Matyushkin on 21.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public struct GradientStep {
    var color: UIColor
    var location: Float
    
    public init(color: UIColor, location: Float) {
        self.color = color
        self.location = location
    }
}
