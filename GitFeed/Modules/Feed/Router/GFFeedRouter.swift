//
//  FeedGFFeedRouter.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

class FeedRouter: FeedRouterInput {
    func showRepoDetails(_ repo: GFRepo){
        GFNavigationModule.shared.showRepo(with: repo)
    }
}
