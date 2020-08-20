import Foundation
import UIKit

extension Bundle {
    
    public static func Cluster() -> Bundle {
        return Bundle(identifier: "com.wizman.awesome-libraries.LibraryDemo-Cluster")!
    }
    
    public static func Cluster_image(named imageName: String) -> UIImage? {
        return UIImage(named: imageName, in: self.Cluster(), compatibleWith: nil)
    }
}
