import Foundation

public struct LibraryTag {
    public let name: String
}

extension LibraryTag {
    
    public static var ui: LibraryTag {
        return LibraryTag(name: "UI")
    }
    
    public static var networking: LibraryTag {
        return LibraryTag(name: "networking")
    }
}
