import Foundation

public class HapticoPattern {
    var pattern: String
    var delay: Double
    
    init(pattern: String, delay: Double = 0.02) {
        self.pattern = pattern
        self.delay = delay
    }
}
