import UIKit

public class LibraryDemoViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GlitchLabel Demo"
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
