import UIKit

extension UIBezierPath {
    
    func firstPoint() -> CGPoint? {
        var firstPoint: CGPoint? = nil
        cgPath.forEach { element in
            guard firstPoint == nil else { return }
            assert(element.type == .moveToPoint, "Expected the first point to be a move")
            firstPoint = element.points.pointee
        }
        return firstPoint
    }
}
