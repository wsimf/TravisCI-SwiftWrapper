//
//  TravisBuild.swift
//  TravisCI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

struct TravisBuild {
    
    var id: String? = nil
    var commitId: String? = nil
    var repoId: String? = nil
    var buildNumber: String? = nil
    var startedAt: Date? = nil
    var finishedAt: Date? = nil
    var duration: String? = nil
    var state: String? = nil
}
