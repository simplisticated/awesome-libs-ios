import UIKit
import AwesomeStyles
import AwesomeFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        StyleSheet.default = .colorful
        self.setupWindow()
        return true
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
