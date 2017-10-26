//
//  TravisSessionConfig.swift
//  Travis-CI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

struct TravisSession {
    
    private static var sessionConfigs: [TravisConfigType : TravisSession] = [:]
    
    let sessionManager: TravisSessionManager
    
    private init(sessionConfig: URLSessionConfiguration, travisConfig: TravisConfig) {
        self.sessionManager = TravisSessionManager(configuration: sessionConfig, travisConfig: travisConfig)
        self.sessionManager.adapter = TravisAuthAdapter()
    }
    
    func request(_ urlRequest: TravisURLRequestConvertible) -> DataRequest {
        return self.sessionManager.request(urlRequest)
    }
    
    static func getSessionConfig(froTravisConfigType configType: TravisConfigType) -> TravisSession {
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
    
        let session = TravisSession(sessionConfig: newSessionUrlConfig, travisConfig: newTravisConfig)
        sessionConfigs[configType] = session
        
        return session
    }
}
