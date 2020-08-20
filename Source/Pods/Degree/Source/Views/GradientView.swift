//
//  GradientView.swift
//  Degree
//
//  Created by Igor Matyushkin on 21.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

open class GradientView: UIView {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInitialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInitialization()
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    fileprivate var gradientLayer: CAGradientLayer!
    
    fileprivate var _gradient: Gradient?
    
    public var gradient: Gradient? {
        get {
            return self._gradient
        }
        set {
            // Save data
            
            self._gradient = newValue
            
            // Update gradient layer
            
            if let `gradient` = newValue {
                self.gradientLayer.startPoint = gradient.startPoint.cgPoint
                self.gradientLayer.endPoint = gradient.endPoint.cgPoint
                self.gradientLayer.colors = gradient.steps.map({ (step) -> CGColor in
                    return step.color.cgColor
                })
                self.gradientLayer.locations = gradient.steps.map({ (step) -> NSNumber in
                    return NSNumber(value: step.location)
                })
            } else {
                self.gradientLayer.colors = nil
                self.gradientLayer.locations = nil
            }
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update gradient layer
        
        self.gradientLayer.frame = self.bounds
    }
    
    // MARK: Private object methods
    
    fileprivate func customInitialization() {
        // Initialize gradient layer
        
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        self.gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    // MARK: Actions
    
    // MARK: Protocol implementation
    
}
