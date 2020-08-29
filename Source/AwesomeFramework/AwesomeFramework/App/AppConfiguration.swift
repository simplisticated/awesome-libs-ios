import Foundation
import UIKit
import AwesomeData

public struct AppConfiguration {
    
    public struct mainNavigationController {
        public struct events {
            /**
             Called after the event is handled by navigation controller.
             */
            public static var viewDidLoad: ((_ controller: UINavigationController) -> Void)? = nil
        }
    }
    
    public struct libraryListViewController {
        public struct events {
            /**
             Called after the event is handled by view controller.
             */
            public static var viewDidLoad: ((_ controller: LibraryListViewController) -> Void)? = nil
            /**
             Called after the event is handled by view controller.
             */
            public static var viewWillAppear: ((_ controller: LibraryListViewController) -> Void)? = nil
            /**
             Called after the event is handled by view controller.
             */
            public static var viewDidAppear: ((_ controller: LibraryListViewController) -> Void)? = nil
        }
    }
    
    public struct libraryTableViewCell {
        public static var type: AnyLibraryTableViewCell.Type = LibraryTableViewCell.self
        public static var nibName: String = "LibraryTableViewCell"
        public static var bundleIdentifier = Bundle.AwesomeFramework_identifier
    }
    
    public struct libraryViewController {
        public struct events {
            /**
             Called after the event is handled by view controller.
             */
            public static var didSelectItem: ((_ controller: LibraryViewController, _ item: LibraryViewController.Item) -> Void)?
        }
        
        public struct data {
            /**
             If not nil, will be used by `LibraryViewController` instance to build table view's structure.
             Otherwise, `LibraryViewController` instance will use the internal implementation `LibraryViewController.items(for:)`.
             */
            public static var itemsForLibrary: ((_ library: Library) -> [LibraryViewController.Item])?
        }
    }
    
    public struct appStore {
        public struct reviews {
            public static let minimumLaunchCountBeforeReviewRequest: Int = 3
        }
    }
}
