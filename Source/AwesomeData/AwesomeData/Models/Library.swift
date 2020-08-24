import Foundation

public struct Library {
    public let id: String
    public let name: String
    public let description: LibraryDescription
    public let preview: LibraryPreview
    public let developers: [Developer]
    public let links: LibraryLinks
    public let integration: Integration
    public let tags: [LibraryTag]
    public let license: License
    public let demo: LibraryDemo
}

extension Library {
    
    public func supportsAtLeastOnePackageManager() -> Bool {
        return self.integration.cocoapods != nil
            || self.integration.carthage != nil
            || self.integration.swiftPackageManager != nil
    }
    
    public func hasLinks() -> Bool {
        return self.links.github != nil
            || !self.links.other.isEmpty
    }
    
    public func hasDemo() -> Bool {
        return (self.demo.screen?.enabled ?? false)
            || (self.demo.appetize != nil)
    }
}
