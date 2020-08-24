import Foundation

public struct AppetizeLink {
    public let publicKey: String
}

extension AppetizeLink {
    
    public func urlString() -> String {
        return "https://appetize.io/app/\(publicKey)"
    }
}
