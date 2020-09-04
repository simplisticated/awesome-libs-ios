import Foundation

public struct CocoaPodsIntegration {
    public let podName: String
}

extension CocoaPodsIntegration: PackageManagerIntegrationProtocol {
    public func instruction() -> String {
        return "pod '\(self.podName)'"
    }
}
