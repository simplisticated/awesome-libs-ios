import Foundation

public struct GitHubRepositoryLink {
    public let user: String
    public let repository: String
}

extension GitHubRepositoryLink {
    
    public func urlStringWithoutProtocol() -> String {
        return "github.com/\(self.user)/\(self.repository)"
    }
    
    public func urlString() -> String {
        return "https://github.com/\(self.user)/\(self.repository)"
    }
}
