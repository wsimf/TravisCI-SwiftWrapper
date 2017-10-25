//
//  TravisAuthTest.swift
//  TravisCITests
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

import XCTest
@testable import TravisCI

class TravisAuthTests: XCTestCase {
    
    func testAuth() {
        let auth = TravisAuth(withGithubToken: "Invalid_Token", .free)
        auth.getExchangeTravisToken()
    }
}
