//
//  FeedGFFeedPresenter.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

class FeedPresenter: FeedModuleInput, FeedViewOutput, FeedInteractorOutput {
    
    weak var view: FeedViewInput!
    var interactor: FeedInteractorInput!
    var router: FeedRouterInput!
    
    var headerIsRefreshing = false
    
    var waitingForEvents = false
    
    var feedEvents:[GFEvent] = []
    var currentPage = 1
    
    func viewIsReady() {
        self.view.setupInitialState()
        self.view.showHud()
        self.interactor.getEvents()
    }
    
    func didAppear(){
        //Start timer here in case we want to pull events each minute.
    }
    
    func didDisappear(){
        //"Stop timer here."
    }
    
    func getEventsSucceded(allEvents: [GFEvent]) {
        self.view.hideHud()
        currentPage = 1
        self.feedEvents = allEvents
        if headerIsRefreshing {
            self.view.stopHeaderRefreshWith(feedEvents)
            headerIsRefreshing = false
        } else {
            self.view.showEvents(events: feedEvents)
        }
    }
    
    func getEventsFailed(message: String) {
        self.view.hideHud()
        self.view.showError(error: message)
        if headerIsRefreshing {
            self.view.stopHeaderRefreshWith([])
        }
    }
    
    func triggeredPullDownToRefresh(){
        self.interactor.getEvents()
        headerIsRefreshing = true
    }
    
    func triggeredPullUpToGetMore(){
        if waitingForEvents {
            return
        }
        currentPage += 1
        self.interactor.getEvents(for: currentPage)
        waitingForEvents = true
    }
    
    func getEventsSucceded(for page: Int, events: [GFEvent]){
        feedEvents.append(contentsOf: events)
        self.view.stopBottomRefreshWith(feedEvents)
        waitingForEvents = false
    }
    
    func getEventsFailed(for page: Int, message: String){
        self.view.hideHud()
        self.view.stopBottomRefresh()
        self.view.showError(error: message)
        waitingForEvents = false
    }
    
    func didSelectCell(with repo: GFRepo){
        self.router.showRepoDetails(repo)
    }
}
