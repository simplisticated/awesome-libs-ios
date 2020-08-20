import Foundation

public struct Integration {
    public let cocoapods: CocoaPodsIntegration?
    public let carthage: CarthageIntegration?
    public let swiftPackageManager: SwiftPackageManagerIntegration?
}

public struct CocoaPodsIntegration {
    public let instruction: String
}

public struct CarthageIntegration {
    public let instruction: String
}

public struct SwiftPackageManagerIntegration {
    public let instruction: String
}
