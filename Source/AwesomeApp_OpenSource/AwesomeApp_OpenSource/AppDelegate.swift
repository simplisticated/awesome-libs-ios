import UIKit
import AwesomeStyles
import AwesomeFramework
import AwesomeViewControllers
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        StyleSheet.default = .colorful
        self.updateSettingsOnLaunch()
        self.setupConfiguration()
        self.setupWindow()
        return true
    }
    
    private func updateSettingsOnLaunch() {
        Settings.launchCount.value += 1
    }
    
    private func setupConfiguration() {
        AppConfiguration.libraryListViewController.events.viewDidAppear = { controller in
            let shouldRequestReview = !Settings.didRequestReview
                && Settings.launchCount.value >= AppConfiguration.appStore.reviews.minimumLaunchCountBeforeReviewRequest
            
            if shouldRequestReview {
                SKStoreReviewController.requestReview()
                Settings.reviewRequestTimestamp.value = Date().timeIntervalSince1970
            }
        }
        
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
