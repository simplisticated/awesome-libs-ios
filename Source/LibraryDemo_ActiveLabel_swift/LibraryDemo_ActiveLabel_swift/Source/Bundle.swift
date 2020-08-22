//
//  Bundle.swift
//  LibraryDemo_ActiveLabel_swift
//
//  Created by Visuality on 22.08.2020.
//

import Foundation

extension Bundle {
    
    public static var LibraryDemo_ActiveLabel_swift_identifier: String {
        return "com.wizman.awesome-libraries.LibraryDemo-ActiveLabel-swift"
    }
    
    public static var ActiveLabel_swift: Bundle {
        return Bundle(identifier: self.LibraryDemo_ActiveLabel_swift_identifier)!
    }
}
