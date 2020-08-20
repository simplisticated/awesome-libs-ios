//
//  UIColorExtensionInitialization.swift
//  Pixels
//
//  Created by Igor Matyushkin on 05.06.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    public convenience init(rgbaColor: RGBAColor) {
        self.init(
            red: rgbaColor.red.cgFloatValue,
            green: rgbaColor.green.cgFloatValue,
            blue: rgbaColor.blue.cgFloatValue,
            alpha: rgbaColor.alpha.cgFloatValue
        )
    }
    
    public convenience init?(hexString: String) {
        guard let rgbaColor = RGBAFormatter().rgbaColor(fromHexString: hexString) else {
            return nil
        }
        
        self.init(rgbaColor: rgbaColor)
    }
    
}
