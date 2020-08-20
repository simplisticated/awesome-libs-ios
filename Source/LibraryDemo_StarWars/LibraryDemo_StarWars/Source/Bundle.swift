import Foundation
import UIKit

extension Bundle {
    
    public static func StarWars() -> Bundle {
        return Bundle(identifier: "com.wizman.awesome-libraries.LibraryDemo-StarWars")!
    }
    
    public static func StarWars_image(named imageName: String) -> UIImage? {
        return UIImage(named: imageName, in: .StarWars(), compatibleWith: nil)
    }
}
