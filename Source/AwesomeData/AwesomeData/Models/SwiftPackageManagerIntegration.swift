import Foundation

public struct SwiftPackageManagerIntegration {
    public let path: String
}

extension SwiftPackageManagerIntegration: PackageManagerIntegrationProtocol {
    public func instruction() -> String {
        return "\(self.path)"
    }
}
