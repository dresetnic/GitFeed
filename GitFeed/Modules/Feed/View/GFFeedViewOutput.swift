//
//  FeedGFFeedViewOutput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

protocol FeedViewOutput {

    /**
        @author Dragos Resetnic
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func didAppear()
    func didDisappear()
    
    func triggeredPullDownToRefresh()
    func triggeredPullUpToGetMore()
    
    func didSelectCell(with repo: GFRepo)
}
