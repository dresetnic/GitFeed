//
//  GFNetworkManager.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation
import Alamofire

public typealias SuccessCompletion = (Any)->Void
public typealias FailureCompletion = (Error)->Void
public typealias CompletionGetEvents = (Error?, Bool, [GFEvent]?)->Void
public typealias CompletionGetRepoDetails = (Error?, Bool, GFRepoDetails?) -> Void

class GFNetworkManager: GFNetworkManagerProtocol {
    
    static let shared: GFNetworkManagerProtocol = GFNetworkManager()
    
    func getRepoDetails(name: String, completion: @escaping CompletionGetRepoDetails){
        
        self.request(urlRequest: GFRouter.repo(name), successCompletion: { (json) in
            
            if let dictionary = json as? Dictionary<String, AnyObject>{
                let repoDetails = GFRepoDetails(dictionary: dictionary)
                completion(nil, true, repoDetails)
            } else {
                completion (nil, false, nil)
            }
        }) { (error) in
            completion(error , false, nil)
        }
    }
    
    func getEvents(page: Int, completion: @escaping CompletionGetEvents) {
        
        let parameters = ["page": page,
                          "per_page": defaultItemsPerPage]
        
        self.request(urlRequest: GFRouter.events(parameters), successCompletion: { (json) in
            
            var allEvents = [GFEvent]()
            
            if let jsonArrayEvents = json as? Array<Dictionary<String, AnyObject>>{
                for eventDictionaryInfo in jsonArrayEvents {
                    let event = GFEvent(with: eventDictionaryInfo)
                    allEvents.append(event)
                }
            }
            completion(nil, true, allEvents)
        }) { (error) in
            completion(error, false, nil)
        }
    }
    
    func getTopEvents(completion: @escaping CompletionGetEvents) {
        getEvents(page: 1, completion: completion)
    }
    
    func request(urlRequest: URLRequestConvertible, successCompletion: @escaping SuccessCompletion, failCompletion failureCompletion: @escaping FailureCompletion) {
        Alamofire.request(urlRequest).validate().responseJSON {(response) in
            switch response.result {
            case .success:
                if let json = response.result.value {
                    successCompletion(json)
                }
                break
            case .failure(let error):
                failureCompletion(error)
            }
        }
    }
}
