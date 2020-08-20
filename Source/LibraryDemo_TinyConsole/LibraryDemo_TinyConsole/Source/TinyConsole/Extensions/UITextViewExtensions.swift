import Foundation
import UIKit

internal extension UITextView {
    static let console: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.black
        textView.isEditable = false
        textView.alwaysBounceVertical = true
        return textView
    }()
    
    func clear() {
        text = ""
    }
    
    func boundsHeightLessThenContentSizeHeight() -> Bool {
        return bounds.height < contentSize.height
    }
}
