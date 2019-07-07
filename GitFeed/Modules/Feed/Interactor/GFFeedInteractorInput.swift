//
//  GFFeedGFFeedInteractorInput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import Foundation

protocol FeedInteractorInput {
    func getEvents()
    func getEvents(for page: Int)
}


