//
//  TravisCommunicator.swift
//  TravisCI
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation

public class TravisCommunicator : HostProvider {
    
    let config: TravisSessionConfig
    
    init(withConfig config: TravisSessionConfig) {
        self.config = config
        self.config.sessionManager.adapter = TravisAuthAdapter()
        UrlManager.hostProvider = self
    }
    
    func getHost() -> String {
        return config.travisConfig!.host
    }
}
