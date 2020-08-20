import UIKit

public class LibraryDemoViewController: UIViewController {
    
    private var pastelView: PastelView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pastel Demo"
        
        let pastelView = PastelView(frame: view.bounds)

        //MARK: -  Custom Direction

        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight

        //MARK: -  Custom Duration
        
        pastelView.animationDuration = 3.0

        //MARK: -  Custom Color

        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])

        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        self.pastelView = pastelView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.pastelView.frame = self.view.bounds
    }
}
