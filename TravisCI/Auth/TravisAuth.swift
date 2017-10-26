//
//  TravisAuth.swift
//  TravisCI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

public class TravisAuth {
    
    let githubToken: String
    let session: TravisSession
    
    public init(withGithubToken githubToken: String, _ configType: TravisConfigType) {
        self.githubToken = githubToken
        self.session = TravisSession.getSessionConfig(froTravisConfigType: configType)
    }
    
    public func getExchangeTravisToken() {
        session.request(UrlManager.auth(githubToken: githubToken))
            .validate()
            .responseJSON { (response) in
                
        }
    }
}
