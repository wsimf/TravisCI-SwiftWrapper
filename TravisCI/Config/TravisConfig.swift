//
//  TravisConfig.swift
//  TravisCI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

public enum TravisConfigType: RawRepresentable, Hashable {
    
    case free
    case pro
    case enterprise(host: String)
    
    public typealias RawValue = String
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case "free":
            self = .free
            
        case "pro":
            self = .pro
            
        case _ where rawValue.starts(with: "enterprise"):
            let splitValue = rawValue.split(separator: "_")
            self = .enterprise(host: String(splitValue[1]))
            
        default:
            NSLog("Invalid rawType for TravisConfigType \(rawValue)")
            return nil
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .free:
            return "free"
            
        case .pro:
            return "pro"
            
        case .enterprise(let host):
            return "enterprise_\(host)"
        }
    }
    
    public static func == (lhs: TravisConfigType, rhs: TravisConfigType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    public var hashValue: Int {
        return self.rawValue.hashValue
    }
}

struct TravisConfig {
    
    let host: String
    let userAgent: String = "CI-Check-iOS/v1.1"
    let acceptType = "application/vnd.travis-ci.2+json"
    
    static func getTravisConfig(forTye type: TravisConfigType) -> TravisConfig {
        switch type {
        case .free:
            return TravisConfig.getTravisFreeConfig()
            
        case .pro:
            return TravisConfig.getTravisProConfig()
            
        case .enterprise(let host):
            return TravisConfig.getTravisEnterpriseConfig(withHost: host)
        }
    }
    
    private static func getTravisFreeConfig() -> TravisConfig {
        let config = TravisConfig(host: "https://api.travis-ci.org")
        return config
    }
    
    private static func getTravisProConfig() -> TravisConfig {
        let config = TravisConfig(host: "https://api.travis-ci.com")
        return config
    }
    
    private static func getTravisEnterpriseConfig(withHost host: String) -> TravisConfig {
        let config = TravisConfig(host: host)
        return config
    }
    
    public static func == (lhs: TravisConfig, rhs: TravisConfig) -> Bool {
        return (lhs.host == rhs.host) && (lhs.acceptType == rhs.acceptType) && (lhs.userAgent == lhs.userAgent)
    }
}
