//
//  ColorManagerExtensionOperations.swift
//  Pixels
//
//  Created by Igor Matyushkin on 23.11.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension ColorManager {
    
    @discardableResult
    public func invert(invertAlpha: Bool) -> ColorManager {
        let invertedRGBAColor = RGBAColor(
            red: RGBAComponent(cgFloatValue: 1.0 - self.rgba.red.cgFloatValue),
            green: RGBAComponent(cgFloatValue: 1.0 - self.rgba.green.cgFloatValue),
            blue: RGBAComponent(cgFloatValue: 1.0 - self.rgba.blue.cgFloatValue),
            alpha: RGBAComponent(cgFloatValue: invertAlpha ? 1.0 - self.rgba.red.cgFloatValue : self.rgba.alpha.cgFloatValue)
        )
        
        let invertedColor = UIColor(rgbaColor: invertedRGBAColor)
        return ColorManager(color: invertedColor)
    }
    
    @discardableResult
    public func mix(with otherColor: RGBAColor) -> ColorManager {
        let mixedRGBAColor = RGBAColor(
            red: RGBAComponent(
                cgFloatValue: (self.rgba.red.cgFloatValue + otherColor.red.cgFloatValue) / 2.0
            ),
            green: RGBAComponent(
                cgFloatValue: (self.rgba.green.cgFloatValue + otherColor.green.cgFloatValue) / 2.0
            ),
            blue: RGBAComponent(
                cgFloatValue: (self.rgba.blue.cgFloatValue + otherColor.blue.cgFloatValue) / 2.0
            ),
            alpha: RGBAComponent(
                cgFloatValue: (self.rgba.alpha.cgFloatValue + otherColor.alpha.cgFloatValue) / 2.0
            )
        )
        
        let mixedColor = UIColor(rgbaColor: mixedRGBAColor)
        return ColorManager(color: mixedColor)
    }
    
    @discardableResult
    public func mix(with otherColor: UIColor) -> ColorManager {
        let otherRGBAColor = RGBAColor.from(color: otherColor)
        return self.mix(with: otherRGBAColor)
    }
    
}
