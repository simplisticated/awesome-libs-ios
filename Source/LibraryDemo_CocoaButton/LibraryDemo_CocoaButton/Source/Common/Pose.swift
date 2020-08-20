import UIKit

struct Pose {
    
    let secondsSincePriorPose: CFTimeInterval
    let start: CGFloat
    let length: CGFloat
    
    init(_ secondsSincePriorPose: CFTimeInterval, _ start: CGFloat, _ length: CGFloat) {
        self.secondsSincePriorPose = secondsSincePriorPose
        self.start = start
        self.length = length
    }
}
