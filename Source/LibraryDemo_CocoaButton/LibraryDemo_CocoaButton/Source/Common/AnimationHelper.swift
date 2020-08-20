import UIKit

class AnimationHelper {
    
    class func animateShadowOpacity(forLayer: CALayer, fromValue: Float, toValue: Float, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        forLayer.add(animation, forKey: animation.keyPath)
        forLayer.shadowOpacity = toValue
    }
}
