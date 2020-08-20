import UIKit

let kCounterRate = Float(3.0)

public protocol ProgressCounter {
    func update(_ t: CGFloat) -> CGFloat
}

public class ProgressCounterLinear: ProgressCounter {
    public func update(_ t: CGFloat) -> CGFloat {
        return t
    }
}

public class ProgressCounterEaseIn: ProgressCounter {
    public func update(_ t: CGFloat) -> CGFloat {
        return CGFloat(powf(Float(t), kCounterRate))
    }
}

public class ProgressCounterEaseOut: ProgressCounter {
    public func update(_ t: CGFloat) -> CGFloat {
        return CGFloat(1.0 - powf(Float(1.0 - t), kCounterRate))
    }
}

public class ProgressCounterEaseInOut: ProgressCounter {
    public func update(_ t: CGFloat) -> CGFloat {
        let newt: CGFloat = 2 * t
        if newt < 1 {
            return CGFloat(0.5 * powf (Float(newt), kCounterRate))
        } else {
            return CGFloat(0.5 * (2.0 - powf(Float(2.0 - newt), kCounterRate)))
        }
    }
}
