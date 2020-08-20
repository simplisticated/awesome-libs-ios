import UIKit

public class LibraryDemoViewController: UIViewController {

    let linearBar: LinearProgressBar = LinearProgressBar()

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LinearProgressBar Demo"
        self.configureLinearProgressBar()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.linearBar.stopAnimation()
    }

    @IBAction func startAnimation(_ sender: AnyObject) {
        self.linearBar.startAnimation()
    }
    
    @IBAction func stopAnimation(_ sender: AnyObject) {
        self.linearBar.stopAnimation()
    }
    
    //-----
    
    fileprivate func configureLinearProgressBar(){
        linearBar.backgroundColor = UIColor(red:0.68, green:0.81, blue:0.72, alpha:1.0)
        linearBar.progressBarColor = UIColor(red:0.26, green:0.65, blue:0.45, alpha:1.0)
        linearBar.heightForLinearBar = 5
    }
}
