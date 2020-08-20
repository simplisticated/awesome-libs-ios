import Foundation
import UIKit
import AwesomeViewControllers

public typealias LibraryDemoViewController = TinyConsoleController

extension TinyConsoleController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        let mainViewController = MainViewController()
        let resultController = TinyConsole.createViewController(rootViewController: mainViewController)
        resultController.title = "TinyConsole Demo"
        return resultController as! Self
    }
}
