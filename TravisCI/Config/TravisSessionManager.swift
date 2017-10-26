//
//  SessionManager+TravisCI.swift
//  TravisCI
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Alamofire

protocol TravisURLRequestConvertible : URLRequestConvertible {
    func asURLRequest(withTravisConfig config: TravisConfig) throws -> URLRequest
}

class TravisSessionManager : Alamofire.SessionManager {
    
    let travisConfig: TravisConfig
    
    init?(session: URLSession, delegate: SessionDelegate, serverTrustPolicyManager: ServerTrustPolicyManager?, travisConfig: TravisConfig) {
        self.travisConfig = travisConfig
        super.init(session: session, delegate: delegate, serverTrustPolicyManager: serverTrustPolicyManager)
    }
    
    init(configuration: URLSessionConfiguration, delegate: SessionDelegate, serverTrustPolicyManager: ServerTrustPolicyManager?, travisConfig: TravisConfig) {
        self.travisConfig = travisConfig
        super.init(configuration: configuration, delegate: delegate, serverTrustPolicyManager: serverTrustPolicyManager)
    }
    
    init(configuration: URLSessionConfiguration, travisConfig: TravisConfig) {
        self.travisConfig = travisConfig
        super.init(configuration: configuration)
    }
    
    func request(_ urlRequest: TravisURLRequestConvertible) -> DataRequest {
        let urlRequest = try! urlRequest.asURLRequest(withTravisConfig: travisConfig)
        return self.request(urlRequest)
    }
}
