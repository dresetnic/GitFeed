//
//  GFRouter.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation
import Alamofire

public enum GFRouter : URLRequestConvertible{
    
    case events([String: Int])
    case repo(String)
    
    static let baseURL = "https://api.github.com/"
    
    static let eventsPath = "events"
    static let repoPath = "repos/"
    
    var method: HTTPMethod {
        switch self {
        case .events:
            return .get
        case .repo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .events:
            return GFRouter.eventsPath
        case .repo(let repoName):
            return GFRouter.repoPath + repoName
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try GFRouter.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        switch self {
        case .events(let paramaters):
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: paramaters)
        case .repo:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }
        return urlRequest
    }
}
