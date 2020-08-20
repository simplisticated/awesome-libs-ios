import UIKit

public class LibraryDemoViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "LiquidLoader Demo"
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red: 9 / 255.0, green: 21 / 255.0, blue: 37 / 255.0, alpha: 1.0)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupLoaders()
    }
    
    private func setupLoaders() {
        let container = self.containerView!
        
        let lineColor = UIColor(red: 77 / 255.0, green: 255 / 255.0, blue: 182 / 255.0, alpha: 1.0)
            let growColor = UIColor.red

            let lineFrame = CGRect(x: self.view.frame.width * 0.5 - 100, y: 100, width: 200, height: 100)
            let lineLoader = LiquidLoader(frame: lineFrame, effect: .growLine(lineColor,7,10.0, growColor))
            
            let circleFrame = CGRect(x: self.view.frame.width * 0.5 - 100, y: 200, width: 200, height: 200)
            let circleColor = UIColor(red: 77 / 255.0, green: 182 / 255.0, blue: 255 / 255.0, alpha: 1.0)
            let circleLoader = LiquidLoader(frame: circleFrame, effect: .growCircle(circleColor,10,1.0, growColor))

            let circleMatColor = UIColor(red: 255 / 255.0, green: 188 / 255.0, blue: 188 / 255.0, alpha: 1.0)
            let circleMatFrame = CGRect(x: self.view.frame.width * 0.5 - 25, y: 450, width: 50, height: 50)
            let circleMat = LiquidLoader(frame: circleMatFrame, effect: .circle(circleMatColor,8,5.0, growColor))
        
            let lineMatColor = UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 188 / 255.0, alpha: 1.0)
            let lineMatFrame = CGRect(x: self.view.frame.width * 0.5 - 25, y: 500, width: 50, height: 50)
            let lineMat = LiquidLoader(frame: lineMatFrame, effect: .line(lineMatColor,4,1.0, growColor))
        
            container.addSubview(lineLoader)
            container.addSubview(circleLoader)
            container.addSubview(circleMat)
            container.addSubview(lineMat)
    }
}
