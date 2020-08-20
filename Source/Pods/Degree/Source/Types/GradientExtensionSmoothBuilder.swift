//
//  GradientExtensionSmoothBuilder.swift
//  Degree
//
//  Created by Igor Matyushkin on 17.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension Gradient {
    
    public class SmoothBuilder {
        
        fileprivate var startPoint: GradientPoint
        
        fileprivate var endPoint: GradientPoint
        
        fileprivate var colors: [UIColor]!
        
        public var get: Gradient {
            get {
                var steps = [GradientStep]()
                let stepSize = 1.0 / Float(self.colors.count + 1)
                
                for i in 0..<self.colors.count {
                    let color = self.colors[i]
                    let location = stepSize * Float(i + 1)
                    let step = GradientStep(
                        color: color,
                        location: location
                    )
                    steps.append(step)
                }
                
                return Gradient(
                    startPoint: self.startPoint,
                    endPoint: self.endPoint,
                    steps: steps
                )
            }
        }
        
        internal init() {
            self.startPoint = GradientPoint(
                x: .left,
                y: .top
            )
            self.endPoint = GradientPoint(
                x: .right,
                y: .bottom
            )
            self.colors = []
        }
        
        public func from(_ point: GradientPoint) -> Self {
            self.startPoint = point
            return self
        }
        
        public func to(_ point: GradientPoint) -> Self {
            self.endPoint = point
            return self
        }
        
        public func color(_ value: UIColor) -> Self {
            self.colors.append(value)
            return self
        }
        
    }
    
}
