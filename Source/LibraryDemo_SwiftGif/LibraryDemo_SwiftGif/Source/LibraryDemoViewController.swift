import UIKit

public class LibraryDemoViewController: UIViewController {
    
    @IBOutlet private weak var topImageView: UIImageView!
    
    @IBOutlet private weak var bottomImageView: UIImageView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SwiftGif Demo"
        self.topImageView.loadGif(name: "jeremy")
        self.bottomImageView.loadGif(name: "adventure-time")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
