import UIKit
import Pixels
import AwesomeData

public class PackageManagerShortInstructionView: UIView {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    
    @IBOutlet private weak var packageManagerNameLabel: UILabel!
    
    @IBOutlet private weak var instructionLabel: UILabel!
    
    public var isPressed = false {
        didSet {
            self.backgroundColor = self.isPressed
                ? styles.view.pressedBackgroundColor()
                : styles.view.backgroundColor()
        }
    }
    
    public var packageManager: PackageManager? {
        didSet {
            if let packageManager = self.packageManager {
                self.logoImageView.image = content.image(for: packageManager)
                self.packageManagerNameLabel.text = content.name(for: packageManager)
            } else {
                self.logoImageView.image = nil
                self.packageManagerNameLabel.text = ""
            }
        }
    }
    
    public var instruction: Instruction? {
        didSet {
            if let instruction = self.instruction {
                self.instructionLabel.text = content.text(for: instruction)
                self.instructionLabel.textColor = styles.instructionLabel.textColor(for: instruction)
            } else {
                self.instructionLabel.text = ""
            }
        }
    }
    
    public weak var delegate: PackageManagerShortInstructionViewDelegate?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.isPressed = false
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isPressed = true
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isPressed {
            if let location = touches.first?.location(in: self) {
                if !self.frame.contains(location) {
                    self.isPressed = false
                }
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let wasPressed = self.isPressed
        self.isPressed = false
        
        if wasPressed {
            self.delegate?.packageManagerShortInstructionViewDidTap(self)
        }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isPressed = false
    }
}

extension PackageManagerShortInstructionView {
    
    public enum Instruction {
        case text(value: String)
        case notSupported
    }
}

fileprivate struct styles {
    
    struct view {
        
        static func backgroundColor() -> UIColor {
            return UIColor(hexString: "#dfdfdf")!
        }
        
        static func pressedBackgroundColor() -> UIColor {
            return UIColor(hexString: "#bfbfbf")!
        }
    }
    
    struct instructionLabel {
        
        static func textColor(for instruction: PackageManagerShortInstructionView.Instruction) -> UIColor {
            switch instruction {
            case .text:
                return UIColor.Material.Black.default
            case .notSupported:
                return UIColor.Material.Black.default.withAlphaComponent(0.5)
            }
        }
    }
}

fileprivate struct content {
    
    static func image(for packageManager: PackageManager) -> UIImage {
        switch packageManager {
        case .cocoapods:
            return UIImage(named: "cocoapods", in: .AwesomeFramework, compatibleWith: nil)!
        case .carthage:
            return UIImage(named: "carthage", in: .AwesomeFramework, compatibleWith: nil)!
        case .swiftPackageManager:
            return UIImage(named: "spm", in: .AwesomeFramework, compatibleWith: nil)!
        }
    }
    
    static func name(for packageManager: PackageManager) -> String {
        switch packageManager {
        case .cocoapods:
            return "CocoaPods"
        case .carthage:
            return "Carthage"
        case .swiftPackageManager:
            return "Swift Package Manager"
        }
    }
    
    static func text(for instruction: PackageManagerShortInstructionView.Instruction) -> String {
        switch instruction {
        case .text(let value):
            return value
        case .notSupported:
            return "Not supported"
        }
    }
}
