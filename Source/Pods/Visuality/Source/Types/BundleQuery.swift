//
//  Bundle.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum BundleQuery {
    case main
    case byInstance(bundle: Bundle)
    case byIdentifier(identifier: String)
}
