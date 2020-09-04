import Foundation

public struct LibraryPackageManagers {
    public let cocoapods: CocoaPodsIntegration?
    public let carthage: CarthageIntegration?
    public let swiftPackageManager: SwiftPackageManagerIntegration?
}
