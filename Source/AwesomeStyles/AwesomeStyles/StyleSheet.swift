import Foundation
import UIKit
import Pixels

public struct StyleSheet {
    public let mainColor: UIColor
    public let additionalColor: UIColor
    public let lightBackgroundColor: UIColor
    public let darkBackgroundColor: UIColor
    public let navigationBarBackgroundColor: UIColor
    public let navigationBarButtonColor: UIColor
    public let liveDemoColor: UIColor
}

extension StyleSheet {
    
    public static var colorful: StyleSheet {
        return StyleSheet(
            mainColor: UIColor.Material.DeepOrange.a400,
            additionalColor: UIColor.Material.Teal.a700,
            lightBackgroundColor: UIColor.Material.White.default,
            darkBackgroundColor: UIColor.Material.Black.default,
            navigationBarBackgroundColor: UIColor.Material.White.default,
            navigationBarButtonColor: UIColor.Material.DeepOrange.a400,
            liveDemoColor: UIColor.Material.Teal.a700
        )
    }
    
    public static var premium: StyleSheet {
        return StyleSheet(
            mainColor: UIColor.Material.DeepOrange.a400,
            additionalColor: UIColor.Material.Teal.a700,
            lightBackgroundColor: UIColor.Material.White.default,
            darkBackgroundColor: UIColor.Material.Black.default,
            navigationBarBackgroundColor: UIColor.Material.White.default,
            navigationBarButtonColor: UIColor.Material.Black.default,
            liveDemoColor: UIColor.Material.Teal.a700
        )
    }
}

extension StyleSheet {
    
    public static var `default`: StyleSheet = .colorful
}
