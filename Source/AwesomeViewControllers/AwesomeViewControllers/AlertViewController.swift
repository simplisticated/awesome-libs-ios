import Foundation
import UIKit

extension UIAlertController {
    
    public static func awesomeAlertController(withText text: String, cancelButtonEnabled: Bool, whenTappedOkay okayHandler: @escaping () -> Void) -> UIAlertController {
        let controller = UIAlertController(
            title: nil,
            message: text,
            preferredStyle: .alert
        )
        
        if cancelButtonEnabled {
            controller.addAction(
                UIAlertAction(
                    title: "Cancel",
                    style: .cancel,
                    handler: nil
                )
            )
        }
        
        controller.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    okayHandler()
                }
            )
        )
        
        return controller
    }
}
