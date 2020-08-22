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
    
    public func hasDemo() -> Bool {
        return (self.demo.screen != nil)
            || (self.demo.appetize != nil)
    }
}
