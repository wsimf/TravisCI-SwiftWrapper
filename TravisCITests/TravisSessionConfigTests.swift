//
//  TravisSessionConfigTests.swift
//  TravisCITests
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import XCTest
@testable import TravisCI

class TravisSessionConfigTests: XCTestCase {
    
    func testGetNewSessionConfig() {
        let travisConfig = TravisConfig.getTravisConfig(forTye: .free)
        let sessionConfig = TravisSessionConfig.getSessionConfig(froTravisConfigType: .free)
        assert(sessionConfig.sessionManager != nil)
        assert(sessionConfig.travisConfig != nil)
        
        assert(travisConfig == sessionConfig.travisConfig!)
    }
}
