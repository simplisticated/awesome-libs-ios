import Foundation

public struct AppetizeLink {
    public let publicKey: String
    
    public init(publicKey: String) {
        self.publicKey = publicKey
    }
}

extension AppetizeLink {
    
    public func urlString() -> String {
        return "https://appetize.io/app/\(publicKey)"
    }
}
