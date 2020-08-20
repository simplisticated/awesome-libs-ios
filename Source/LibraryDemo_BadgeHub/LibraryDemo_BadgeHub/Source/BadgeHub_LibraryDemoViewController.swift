import UIKit
import AwesomeStyles

public class BadgeHub_LibraryDemoViewController: UIViewController {

    private var hub: BadgeHub?
    
    @IBOutlet private weak var swiftImageView: UIImageView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "BadgeHub Demo"
        
        self.swiftImageView.layer.masksToBounds = false
        
        hub = BadgeHub(view: self.swiftImageView)
        hub?.moveCircleBy(x: -5, y: 3)
        hub?.setCircleColor(StyleSheet.default.mainColor, label: .white)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @objc @IBAction func testIncrement() {
        hub?.increment()
        hub?.pop()
    }
}
