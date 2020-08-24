import UIKit
import AwesomeStyles
import AwesomeFramework
import AwesomeViewControllers

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        StyleSheet.default = .colorful
        self.setupConfiguration()
        self.setupWindow()
        return true
    }
    
    private func setupConfiguration() {
        AppConfiguration.libraryViewController.events.didSelectItem = { controller, item in
            switch item {
            case .launchAppetizeDemo:
                let alert = UIAlertController.awesomeAlertController(
                    withText: "Appetize integration is available in Awesome Libs Premium.",
                    cancelButtonEnabled: false,
                    whenTappedOkay: {
                    }
                )
                controller.present(
                    alert,
                    animated: true,
                    completion: nil
                )
                break
            default:
                break
            }
        }
    }
    
    private func setupWindow() {
        let mainViewController = LibraryListViewController.awesomelyNew()
        
        let navigationController = MainNavigationController(rootViewController: mainViewController)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
