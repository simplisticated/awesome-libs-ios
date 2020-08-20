import UIKit
//import PinterestSegment

public class LibraryDemoViewController: UIViewController {

    @IBOutlet weak var ibSegment: PinterestSegment!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PinterestSegment Demo"
        
        let w = view.frame.width
        let s = PinterestSegment(frame: CGRect(x: 20, y: 100, width: w - 40, height: 40), titles: ["Everything", "Geek", "Humor", "Art", "Food", "Home", "DIY", "Wemoent' Style", "Man's Style", "Beauty", "Travel"])
        s.style.titleFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 5))
        view.addSubview(s)

        var titles = [PinterestSegment.TitleElement]()
        for i in 1...7 {
            guard let image = UIImage(named: "icon_\(i)"),
            let selectedImage = image.maskWithColor(color: ibSegment.style.selectedTitleColor),
            let normalImage = image.maskWithColor(color: ibSegment.style.normalTitleColor)  else { continue }
            titles.append(PinterestSegment.TitleElement(title: "Face-\(i)", selectedImage: selectedImage, normalImage: normalImage))
        }
        ibSegment.setRichTextTitles(titles)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}


extension UIImage {
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}
