import UIKit
//import Haptico
import AwesomeViewControllers

public typealias Haptico_LibraryDemoViewController = ViewController

public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Haptico Demo"
        
        let haptico = Haptico.shared()
        haptico.logEnabled = true
        
        do {
            try haptico.prepare()
        } catch {
            print(error)
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // Generating feedback
    @IBAction func generateSuccess(_ sender: Any) {
        Haptico.shared().generate(.success)
    }
    @IBAction func generateWarning(_ sender: Any) {
        Haptico.shared().generate(.warning)
    }
    @IBAction func generateError(_ sender: Any) {
        Haptico.shared().generate(.error)
    }
    
    // Alert with feedback
    @IBAction func successAlert(_ sender: Any) {
        showAlert(title: "Hurray 📳", message: "This is success alert with haptic feedback", hapticNotification: .success)
    }
    @IBAction func errorAlert(_ sender: Any) {
        showAlert(title: "Oops 📳", message: "This is error alert with haptic feedback", hapticNotification: .error)
    }
    @IBAction func warningAlert(_ sender: Any) {
        showAlert(title: "Warning 📳", message: "This is warning alert with haptic feedback", hapticNotification: .warning)
    }
    
    @IBAction func pattern(_ sender: Any) {
        Haptico.shared().generateFeedbackFromPattern("..oO", delay: 0.1)
    }
    
    private func showAlert(title: String, message: String, hapticNotification: HapticoNotification) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, hapticNotification: hapticNotification, completion: nil)
    }
}

extension ViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .LibraryDemo_Haptico)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        return viewController as! Self
    }
}
