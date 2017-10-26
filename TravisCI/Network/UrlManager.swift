//
//  UrlManager.swift
//  TravisCI
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

enum UrlManager : TravisURLRequestConvertible {
    
    case auth(githubToken: String)
    case getAccounts
    case getBuilds(repoId: String)
    
    /// The HTTP method to use for the request as provided in http://api.travis-ci.com
    var method: HTTPMethod {
        switch self {
        case .auth:
            return .post
            
        case .getAccounts,
             .getBuilds:
            return .get
        }
    }
    
    /// The URL path for the HTTP request
    var path: String {
        switch self {
        case .auth: return "/auth/github"
        case .getAccounts: return "/accounts"
        case .getBuilds(let repoId): return "/repos/\(repoId)/builds"
        }
    }
    
    /// The parameters for the HTTP request, these parameters will be encoded
    /// via the encoding instance given by the property `UrlManager.encoding`
    var parameters: [String : String]? {
        switch self {
        case .auth(let token): return ["github_token" : token]
        default: return nil
        }
    }
    
    /// The encoding object to use for encoding the parameters in the stored property
    /// `UrlManager.parameters`
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest(withTravisConfig config: TravisConfig) throws -> URLRequest {
        let url = try config.host.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
    
    func asURLRequest() throws -> URLRequest {
        return try asURLRequest(withTravisConfig: TravisConfig.getTravisConfig(forTye: .free)) //default
    }
}


