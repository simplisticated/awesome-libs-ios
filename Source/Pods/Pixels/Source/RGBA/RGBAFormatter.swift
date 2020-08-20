//
//  RGBAFormatter.swift
//  Pixels
//
//  Created by Igor Matyushkin on 05.06.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import UIKit

public class RGBAFormatter {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init() {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    public func rgbaColor(fromHexString hexString: String) -> RGBAColor? {
        // Check that hex string is not empty
        
        guard !hexString.isEmpty else {
            return nil
        }
        
        // Obtain hex code string without sharp symbol
        
        let firstSymbolIsSharp = hexString.hasPrefix("#")
        let hexCodeString = firstSymbolIsSharp ? (hexString as NSString).substring(from: 1) : hexString
        
        // Create collection of RGBA component integer values
        
        var rgbaComponents: [RGBAComponent] = [
            RGBAComponent.componentWithMaximumValue(),
            RGBAComponent.componentWithMaximumValue(),
            RGBAComponent.componentWithMaximumValue(),
            RGBAComponent.componentWithMaximumValue()
        ]
        
        // Parse hex code string
        
        let updateRGBAComponentIntegerValue: (_ componentIndex: Int, _ componentValueHexString: String) -> Void = {(componentIndex, componentValueHexString) in
            var rgbaComponentIntegerValue = UInt32(RGBAComponent.maximumIntegerValue)
            
            let scanner = Scanner(string: componentValueHexString)
            scanner.scanHexInt32(&rgbaComponentIntegerValue)
            
            rgbaComponents[componentIndex] = RGBAComponent(integerValue: Int(rgbaComponentIntegerValue))
        }
        
        let lengthOfHexCodeString = hexCodeString.count
        
        switch lengthOfHexCodeString {
        case 3, 4:
            for i in 0..<lengthOfHexCodeString {
                let rangeForHexCodeSubstring = NSMakeRange(i, 1)
                let hexCodeSubstring = (hexCodeString as NSString).substring(with: rangeForHexCodeSubstring)
                let rgbaComponentString = String(format: "0x%@%@", hexCodeSubstring, hexCodeSubstring)
                updateRGBAComponentIntegerValue(i, rgbaComponentString)
            }
            break
        case 6, 8:
            for i in stride(from: 0, to: lengthOfHexCodeString, by: 2) {
                let rangeForHexCodeSubstring = NSMakeRange(i, 2)
                let hexCodeSubstring = (hexCodeString as NSString).substring(with: rangeForHexCodeSubstring)
                let rgbaComponentString = String(format: "0x%@", hexCodeSubstring)
                updateRGBAComponentIntegerValue(i / 2, rgbaComponentString)
            }
            break
        default:
            // Do nothing
            break
        }
        
        // Obtain result RGBA color
        
        let resultRGBAColor = RGBAColor(red: rgbaComponents[0], green: rgbaComponents[1], blue: rgbaComponents[2], alpha: rgbaComponents[3])
        
        // Return result
        
        return resultRGBAColor
    }
    
    public func hexString(fromRGBAColor color: RGBAColor) -> String {
        return String(
            format: "#%2X%2X%2X",
            color.red.integerValue,
            color.green.integerValue,
            color.blue.integerValue
        ).replacingOccurrences(of: " ", with: "0")
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
