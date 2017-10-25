//
//  TravisCITests.swift
//  TravisCITests
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import XCTest
@testable import TravisCI

class TravisConfigTests: XCTestCase {

    func testTravisConfigFreeType() {
        let freeType = TravisConfigType.free
        assert(freeType.rawValue == "free")
        
        let config = TravisConfig.getTravisConfig(forTye: freeType)
        assert(config.host == "https://api.travis-ci.org")
        assert(config.acceptType == "application/vnd.travis-ci.2+json")
        assert(!config.userAgent.isEmpty)
    }
    
    func testTravisConfigFreeTypeInitFromRaw() {
        let freeType = TravisConfigType(rawValue: "free")!
        assert(freeType.rawValue == "free")
        
        let config = TravisConfig.getTravisConfig(forTye: freeType)
        assert(config.host == "https://api.travis-ci.org")
        assert(config.acceptType == "application/vnd.travis-ci.2+json")
        assert(!config.userAgent.isEmpty)
    }
    
    func testTravisConfigProType() {
        let proType = TravisConfigType.pro
        assert(proType.rawValue == "pro")
        
        let config = TravisConfig.getTravisConfig(forTye: proType)
        assert(config.host == "https://api.travis-ci.com")
        assert(config.acceptType == "application/vnd.travis-ci.2+json")
        assert(!config.userAgent.isEmpty)
    }
    
    func testTravisConfigProTypeInitFromRow() {
        let proType = TravisConfigType(rawValue: "pro")!
        assert(proType.rawValue == "pro")
        
        let config = TravisConfig.getTravisConfig(forTye: proType)
        assert(config.host == "https://api.travis-ci.com")
        assert(config.acceptType == "application/vnd.travis-ci.2+json")
        assert(!config.userAgent.isEmpty)
    }
    
    func testTravisConfigEnterpriseType() {
        let proType = TravisConfigType.enterprise(host: "test.com")
        assert(proType.rawValue == "enterprise_test.com")
        
        let config = TravisConfig.getTravisConfig(forTye: proType)
        assert(config.host == "test.com")
        assert(config.acceptType == "application/vnd.travis-ci.2+json")
        assert(!config.userAgent.isEmpty)
    }
    
    func testTravisConfigEnterpriseTypeInitFromRow() {
        let proType = TravisConfigType(rawValue: "enterprise_test.com")!
        assert(proType.rawValue == "enterprise_test.com")
        
        let config = TravisConfig.getTravisConfig(forTye: proType)
        assert(config.host == "test.com")
        assert(config.acceptType == "application/vnd.travis-ci.2+json")
        assert(!config.userAgent.isEmpty)
    }
    
    func testTravisConfigTypeEnterpriseNotEquals() {
        let type1 = TravisConfigType.enterprise(host: "test1.com")
        let type2 = TravisConfigType.enterprise(host: "test2.com")
        assert(type1 != type2)
    }
    
    func testTravisConfigTypeEnterpriseNotEqualsInitFromRaw() {
        let type1 = TravisConfigType(rawValue: "enterprise_test1.com")
        let type2 = TravisConfigType(rawValue: "enterprise_test2.com")
        assert(type1 != type2)
    }
    
    func testTravisConfigTypeEnterpriseEquals() {
        let type1 = TravisConfigType.enterprise(host: "test1.com")
        let type2 = TravisConfigType.enterprise(host: "test1.com")
        assert(type1 == type2)
    }
    
    func testTravisConfigTypeEnterpriseEqualsInitFromRaw() {
        let type1 = TravisConfigType(rawValue: "enterprise_test1.com")
        let type2 = TravisConfigType(rawValue: "enterprise_test1.com")
        assert(type1 == type2)
    }
    
    func testFailInit() {
        let type = TravisConfigType(rawValue: "Invalid_type_sudara")
        assert(type == nil)
    }
}
