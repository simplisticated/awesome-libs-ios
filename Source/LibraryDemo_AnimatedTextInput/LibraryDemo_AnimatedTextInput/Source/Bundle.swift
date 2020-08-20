import Foundation
import UIKit

extension Bundle {
    
    public static func AnimatedTextInput() -> Bundle {
        return Bundle(identifier: "com.wizman.awesome-libraries.LibraryDemo-AnimatedTextInput")!
    }
    
    public static func AnimatedTextInput_image(named imageName: String) -> UIImage? {
        return UIImage(named: imageName, in: self.AnimatedTextInput(), compatibleWith: nil)
    }
}
