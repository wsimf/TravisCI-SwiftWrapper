//
//  Repository.swift
//  CI Check
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

public enum TravisPermission {
    case admin
    case push
    case pull
}

public struct TravisRepository {
    
    var id: Int? = nil
    var slug: String? = nil
    var permission: TravisPermission? = nil
    var description: String? = nil
    var lastBuildId: Int? = nil
    var lastBuildNumber: String? = nil
    var lastBuildState: String? = nil
    var lastBuildDuration: Int? = nil
    var lastBuildStartedAt: Date? = nil
    var lastBuildEndedAt: Date? = nil
    
}

extension TravisRepository: URLConvertible {
    
    public func asURL() throws -> URL {
        let urlString = "/repos/\(id)"
        return try urlString.asURL()
    }
}
