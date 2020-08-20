import UIKit

internal extension UIButton {
    func applyMiniStyle() {
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        layer.cornerRadius = 4
    }
}
