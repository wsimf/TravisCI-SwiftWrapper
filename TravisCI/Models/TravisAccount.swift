//
//  TravisAccount.swift
//  TravisCI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

enum TravisAccountType: String {
    case user
    case organization
}

struct TravisAccount {
    
    var id: String? = nil
    var name: String? = nil
    var login: String? = nil
    var type: TravisAccountType? = nil
    var repositoryCount: Int? = nil
    var isSubscribed: Bool? = nil
}
