import Foundation
import UIKit
import AwesomeData

public protocol LibraryTableViewCellProtocol: UITableViewCell {
    
    var library: Library? { get set }
}

public typealias AnyLibraryTableViewCell = UITableViewCell & LibraryTableViewCellProtocol
