//
//  UrlManager.swift
//  TravisCI
//
//  Created by Sudara Fernando on 26/10/17.
//  Copyright © 2017 Sudara Fernando. All rights reserved.
//

import Foundation
import Alamofire

protocol HostProvider {
    func getHost() -> String
}

enum UrlManager : URLRequestConvertible {
    case auth(githubToken: String)
    case getAccounts
    case getBuilds(repoId: String)
    
    static var hostProvider: HostProvider? = nil
    
    var method: HTTPMethod {
        switch self {
        case .auth:
            return .post
            
        case .getAccounts,
             .getBuilds:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .auth:
            return "/auth/github"
            
        case .getAccounts:
            return "/accounts"
            
        case .getBuilds(let repoId):
            return "/repos/\(repoId)/builds"
        }
    }
    
    var parameters: [String : String]? {
        switch self {
        case .auth(let token):
            return ["github_token" : token]
            
        default:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let hostProvider = UrlManager.hostProvider else {
            throw TravisError.NoHostProvider
        }
        
        let url = try hostProvider.getHost().asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}

