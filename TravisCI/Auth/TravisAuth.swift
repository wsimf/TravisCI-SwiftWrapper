//
//  TravisAuth.swift
//  TravisCI
//
//  Created by Sudara Fernando on 25/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

public class TravisAuth : TravisCommunicator {
    
    let githubToken: String
    
    public init(withGithubToken githubToken: String, _ configType: TravisConfigType) {
        self.githubToken = githubToken
        super.init(withConfig: TravisSessionConfig.getSessionConfig(froTravisConfigType: configType))
        getExchangeTravisToken()
    }
    
    public func getExchangeTravisToken() {
        config.sessionManager.request(UrlManager.auth(githubToken: self.githubToken))
            .validate()
            .responseJSON { (response) in
                print(response.data)
            }
    }
}
