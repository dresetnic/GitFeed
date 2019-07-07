//
//  GFNetworkManagerProtocol.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation

protocol GFNetworkManagerProtocol {
    func getTopEvents(completion: @escaping CompletionGetEvents)
    func getEvents(page: Int, completion: @escaping CompletionGetEvents)
    func getRepoDetails(name: String, completion: @escaping CompletionGetRepoDetails)
}
