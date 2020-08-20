import Foundation

internal extension Bundle {
    
    static func current() -> Bundle {
        return Bundle(
            identifier: "com.wizman.awesome-libraries.LibraryDemo-Charts"
        )!
    }
}
