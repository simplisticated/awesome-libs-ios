//
//  NibQuery.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum NibQuery {
    case byNibName(name: String)
    case byClassName
    case byClassNameWithSuffix(suffix: Suffix)
    case none
}
