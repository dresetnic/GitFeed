//
//  GFFeedGFFeedInteractor.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import Foundation

class FeedInteractor: FeedInteractorInput {
    
    weak var output: FeedInteractorOutput!
    
    func getEvents() {
        GFNetworkManager.shared.getTopEvents {[weak self] (error, isSucces, events) in
            if isSucces {
                DispatchQueue.main.async {
                    self?.output.getEventsSucceded(allEvents: events!)
                }
            } else {
                DispatchQueue.main.async {
                    if let error = error {
                        self?.output.getEventsFailed(message: error.localizedDescription)
                    } else {
                        self?.output.getEventsFailed(message: "Failed to download events.")
                    }
                }
            }
        }
    }
    
    func getEvents(for page: Int){
        GFNetworkManager.shared.getEvents(page: page) {[weak self] (error, isSucces, events) in
            if isSucces {
                DispatchQueue.main.async {
                    self?.output.getEventsSucceded(for: page, events: events!)
                }
            } else {
                DispatchQueue.main.async {
                    if let error = error {
                        self?.output.getEventsFailed(for: page, message: error.localizedDescription)
                    } else {
                        self?.output.getEventsFailed(for: page, message: "Failed to download events.")
                    }
                }
            }
        }
    }
}
