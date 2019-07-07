//
//  GFFeedGFFeedInteractorOutput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import Foundation

protocol FeedInteractorOutput: class {
    func getEventsSucceded(allEvents: [GFEvent])
    func getEventsFailed(message: String)
    
    
    func getEventsSucceded(for page: Int, events: [GFEvent])
    func getEventsFailed(for page: Int, message: String)
}
