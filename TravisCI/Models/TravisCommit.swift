//
//  TravisCommit.swift
//  TravisCI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

public struct TravisCommit {
    
    var id: String? = nil
    var message: String? = nil
    var sha: String? = nil
    var date: Date? = nil
    var authorName: String? = nil
    var authorEmail: String? = nil
    var committerName: String? = nil
    var committerEmail: String? = nil
    var compareUrl: String? = nil
    
}
