import Foundation
import AwesomeData

public protocol LibraryListSearchViewControllerDelegate: class {
    
    func libraryListSearchViewController(_ controller: LibraryListSearchViewController, didSelectLibrary library: Library)
}
