import UIKit
import AwesomeData

class PackageManagerIntegrationTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    
    @IBOutlet private weak var packageManagerNameLabel: UILabel!
    
    @IBOutlet private weak var instructionLabel: UILabel!
    
    private var instruction: Instruction? {
        didSet {
            if let instruction = self.instruction {
                self.instructionLabel.text = content.text(for: instruction)
                self.instructionLabel.textColor = styles.instructionLabel.textColor(for: instruction)
            } else {
                self.instructionLabel.text = ""
            }
        }
    }
    
    public var data: (packageManager: PackageManager, library: Library)? {
        didSet {
            guard let data = self.data else { return }
            
            self.logoImageView.image = content.image(for: data.packageManager)
            
            self.packageManagerNameLabel.text = content.name(for: data.packageManager)
            
            var instructionText: String?
            
            switch data.packageManager {
            case .cocoapods:
                instructionText = data.library.integration.cocoapods?.instruction
                break
            case .carthage:
                instructionText = data.library.integration.carthage?.instruction
                break
            case .swiftPackageManager:
                instructionText = data.library.integration.swiftPackageManager?.instruction
                break
            }
            
            if let instructionText = instructionText {
                self.instruction = .text(value: instructionText)
            } else {
                self.instruction = .notSupported
            }
        }
    }
}

extension PackageManagerIntegrationTableViewCell {
    
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
        
        static func textColor(for instruction: PackageManagerIntegrationTableViewCell.Instruction) -> UIColor {
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
    
    static func text(for instruction: PackageManagerIntegrationTableViewCell.Instruction) -> String {
        switch instruction {
        case .text(let value):
            return value
        case .notSupported:
            return "Not supported"
        }
    }
}
