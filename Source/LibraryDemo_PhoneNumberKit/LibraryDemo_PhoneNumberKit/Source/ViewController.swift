import ContactsUI
import Foundation
//import PhoneNumberKit
import UIKit
import AwesomeViewControllers

public typealias LibraryDemoViewController = ViewController

public class ViewController: UIViewController, CNContactPickerDelegate {
    
    @IBOutlet var textField: PhoneNumberTextField!
    @IBOutlet var withPrefixSwitch: UISwitch!
    @IBOutlet var withFlagSwitch: UISwitch!
    @IBOutlet var withExamplePlaceholderSwitch: UISwitch!
    @IBOutlet var withDefaultPickerUISwitch: UISwitch!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PhoneNumberKit Demo"

        // Country picker is only available on >iOS 11.0
        if #available(iOS 11.0, *) {
            PhoneNumberKit.CountryCodePicker.commonCountryCodes = ["US", "CA", "MX", "AU", "GB", "DE"]
        }
        self.textField.becomeFirstResponder()
        self.withPrefixSwitch.isOn = self.textField.withPrefix
        self.withFlagSwitch.isOn = self.textField.withFlag
        self.withExamplePlaceholderSwitch.isOn = self.textField.withExamplePlaceholder
        if #available(iOS 11.0, *) {
            self.withDefaultPickerUISwitch.isOn = self.textField.withDefaultPickerUI
        }
        
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemBackground
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func didTapView(_ sender: Any) {
        self.textField.resignFirstResponder()
    }

    @IBAction func withPrefixDidChange(_ sender: Any) {
        self.textField.withPrefix = self.withPrefixSwitch.isOn
    }

    @IBAction func withFlagDidChange(_ sender: Any) {
        self.textField.withFlag = self.withFlagSwitch.isOn
    }

    @IBAction func withExamplePlaceholderDidChange(_ sender: Any) {
        self.textField.withExamplePlaceholder = self.withExamplePlaceholderSwitch.isOn
        if !self.textField.withExamplePlaceholder {
            self.textField.placeholder = "Enter phone number"
        }
    }

    @IBAction func withDefaultPickerUIDidChange(_ sender: Any) {
        if #available(iOS 11.0, *) {
            self.textField.withDefaultPickerUI = self.withDefaultPickerUISwitch.isOn
        }
    }
}

extension ViewController: AwesomeViewController {
    
    public static func awesomelyNew() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .PhoneNumberKit)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        return viewController as! Self
    }
}
