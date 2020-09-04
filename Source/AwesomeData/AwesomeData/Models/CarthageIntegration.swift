import Foundation

public struct CarthageIntegration {
    public let server: String
    public let path: String
}

extension CarthageIntegration {
    
    internal static func git(withPath path: String) -> CarthageIntegration {
        return CarthageIntegration(
            server: "git",
            path: path
        )
    }
    
    internal static func github(withPath path: String) -> CarthageIntegration {
        return CarthageIntegration(
            server: "github",
            path: path
        )
    }
}

extension CarthageIntegration: PackageManagerIntegrationProtocol {
    public func instruction() -> String {
        return "\(self.server) \"\(self.path)\""
    }
}
