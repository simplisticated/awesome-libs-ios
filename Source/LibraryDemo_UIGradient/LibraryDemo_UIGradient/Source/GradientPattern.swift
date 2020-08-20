import UIKit

class GradientPattern: NSObject {
    var name: String
    var fromColors: [String]
    var gradient: GradientLayer
    
    init(name: String, fromColors: [String], gradient: GradientLayer) {
        self.name = name
        self.fromColors = fromColors
        self.gradient = gradient
    }
}
