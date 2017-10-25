//
//  TravisSessionConfig.swift
//  Travis-CI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

struct TravisSessionConfig {
    
    private static var sessionConfigs: [TravisConfigType : TravisSessionConfig] = [:]
    
    var travisConfig: TravisConfig? = nil
    let sessionManager: Alamofire.SessionManager
    
    private init(sessionConfig: URLSessionConfiguration, travisConfig: TravisConfig) {
        self.travisConfig = travisConfig
        self.sessionManager = Alamofire.SessionManager(configuration: sessionConfig)
    }
    
    static func getSessionConfig(froTravisConfigType configType: TravisConfigType) -> TravisSessionConfig {
        if let session = sessionConfigs[configType] {
            return session
        }
        
        let newTravisConfig = TravisConfig.getTravisConfig(forTye: configType)
        let newSessionUrlConfig = URLSessionConfiguration.default
        newSessionUrlConfig.httpAdditionalHeaders = [
            "Accept" : newTravisConfig.acceptType,
            "Host" : newTravisConfig.host,
            "User-Agent" : newTravisConfig.userAgent
        ]
    
        let session = TravisSessionConfig(sessionConfig: newSessionUrlConfig, travisConfig: newTravisConfig)
        sessionConfigs[configType] = session
        
        return session
    }
}
