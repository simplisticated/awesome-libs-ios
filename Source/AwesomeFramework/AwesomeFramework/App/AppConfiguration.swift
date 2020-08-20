import Foundation
import UIKit

public struct AppConfiguration {
    let libraryTableViewCellClass: AnyLibraryTableViewCell.Type
    
    public init(
        libraryTableViewCellClass: AnyLibraryTableViewCell.Type
    ) {
        self.libraryTableViewCellClass = libraryTableViewCellClass
    }
}

extension AppConfiguration {
    
    public static var `default`: AppConfiguration = AppConfiguration(
        libraryTableViewCellClass: LibraryTableViewCell.self
    )
}
