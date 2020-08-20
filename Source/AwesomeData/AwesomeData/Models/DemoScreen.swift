import Foundation
import UIKit

public struct DemoScreen {
    public let viewControllerClass: UIViewController.Type
    public let nibName: String?
    public let bundleIdentifier: String
    public let enabled: Bool
}
