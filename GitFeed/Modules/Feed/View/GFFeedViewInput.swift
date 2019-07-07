//
//  FeedGFFeedViewInput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

protocol FeedViewInput: class {

    func setupInitialState()
    func showHud()
    func hideHud()
    func showError(error: String)
    
    func showEvents(events: [GFEvent])
    
    func stopHeaderRefreshWith(_ events:[GFEvent])
    func stopBottomRefreshWith(_ events:[GFEvent])
    func stopBottomRefresh()
}
