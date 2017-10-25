//
//  TravisError.swift
//  TravisCI
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

public enum TravisError : Error {
    case InvalidTravisConfigType(type: String)
    case NoHostProvider
}
