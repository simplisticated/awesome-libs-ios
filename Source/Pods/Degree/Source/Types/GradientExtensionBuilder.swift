//
//  GradientExtensionBuilder.swift
//  Degree
//
//  Created by Igor Matyushkin on 17.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension Gradient {
    
    public class Builder {
        
        fileprivate var startPoint: GradientPoint
        
        fileprivate var endPoint: GradientPoint
        
        fileprivate var steps: [GradientStep]!
        
        public var get: Gradient {
            get {
                return Gradient(
                    startPoint: self.startPoint,
                    endPoint: self.endPoint,
                    steps: self.steps
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
            self.steps = []
        }
        
        public func from(_ point: GradientPoint) -> Self {
            self.startPoint = point
            return self
        }
        
        public func from(x: GradientPointX, y: GradientPointY) -> Self {
            self.startPoint = GradientPoint(
                x: x,
                y: y
            )
            return self
        }
        
        public func to(_ point: GradientPoint) -> Self {
            self.endPoint = point
            return self
        }
        
        public func to(x: GradientPointX, y: GradientPointY) -> Self {
            self.endPoint = GradientPoint(
                x: x,
                y: y
            )
            return self
        }
        
        public func step(withColor color: UIColor, andLocation location: Float) -> Self {
            self.steps.append(
                GradientStep(
                    color: color,
                    location: location
                )
            )
            return self
        }
    }
    
}
