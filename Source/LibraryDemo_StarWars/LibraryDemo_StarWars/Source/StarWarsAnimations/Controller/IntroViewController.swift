import UIKit
import AwesomeViewControllers
//import StarWars

public typealias LibraryDemoViewController = IntroViewController

public class IntroViewController: UIViewController {
    
    @IBOutlet fileprivate var topContraint: NSLayoutConstraint!

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        topContraint.isActive = false
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.topContraint.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func backToIntroViewContoller(_ segue: UIStoryboardSegue) { }
    
    @IBAction func setupYourProfileTapped(_ sender: ProfileButton) {
        sender.animateTouchUpInside {
            self.performSegue(withIdentifier: "presentSettings", sender: sender)
        }
    }
    
    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.transitioningDelegate = self
        if #available(iOS 13.0, *) {
            destination.modalPresentationStyle = .fullScreen
        }
        if let navigation = destination as? UINavigationController,
            let settings = navigation.topViewController as? MainSettingsViewController {
                settings.theme = .light
        }
    }
}

extension IntroViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .StarWars())
        let viewController = storyboard.instantiateViewController(withIdentifier: "library-demo-view-controller") as! IntroViewController
        return viewController as! Self
    }
}

extension IntroViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        StarWarsUIDynamicAnimator()
//        StarWarsUIViewAnimator()
        StarWarsGLAnimator()
    }
}
