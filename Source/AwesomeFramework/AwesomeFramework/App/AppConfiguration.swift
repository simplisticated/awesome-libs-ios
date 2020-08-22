import Foundation
import UIKit

public struct AppConfiguration {
    
    public struct mainNavigationController {
        public struct events {
            public static var viewDidLoad: ((_ controller: UINavigationController) -> Void)? = nil
        }
    }
    
    public struct libraryListViewController {
        public struct events {
            public static var viewDidLoad: ((_ controller: LibraryListViewController) -> Void)? = nil
            public static var viewWillAppear: ((_ controller: LibraryListViewController) -> Void)? = nil
            public static var viewDidAppear: ((_ controller: LibraryListViewController) -> Void)? = nil
        }
    }
    
    public struct libraryTableViewCell {
        public static var type: AnyLibraryTableViewCell.Type = LibraryTableViewCell.self
        public static var nibName: String = "LibraryTableViewCell"
        public static var bundleIdentifier = Bundle.AwesomeFramework_identifier
    }
}
