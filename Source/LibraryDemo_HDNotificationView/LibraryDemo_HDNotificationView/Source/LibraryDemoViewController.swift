import UIKit

public class LibraryDemoViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HDNotificationView Demo"
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction private func fireButtonDidTap() {
        let notiData = HDNotificationData(
            iconImage: UIImage(named: "Icon"),
            appTitle: "Notification View".uppercased(),
            title: "This is a sample of HDNotificationView ⏰",
            message: "This area that you can input some message to notify to user 🔔",
            time: "now")
        
        HDNotificationView.show(data: notiData, onTap: nil, onDidDismiss: nil)
    }
}
