import Foundation

public struct License {
    public let name: String?
    public let url: String
}

extension License {
    
    public static func mit() -> License {
        return License(
            name: "MIT",
            url: ""
        )
    }
    
    public static func apache_v2() -> License {
        return License(
            name: "Apache v2",
            url: ""
        )
    }
}
