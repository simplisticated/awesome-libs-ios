import Foundation
import UIKit
import Pixels
import AwesomeStyles
import Hero

public class MainNavigationController: UINavigationController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupController()
        AppConfiguration.mainNavigationController.events.viewDidLoad?(self)
    }
    
    private func setupController() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.barTintColor = StyleSheet.default.navigationBarBackgroundColor
        self.navigationBar.tintColor = StyleSheet.default.navigationBarButtonColor
        
        self.hero.isEnabled = true
        self.hero.navigationAnimationType = .fade
        
        self.interactivePopGestureRecognizer?.delegate = self
    }
}

extension MainNavigationController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
