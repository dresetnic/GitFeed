//
//  GFRepoGFRepoInteractorTests.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import XCTest

class RepoInteractorTests: XCTestCase {

    let interactor = RepoInteractor()
    
    override func setUp() {
        super.setUp()
        
        let presenter = MockPresenter()
        interactor.output = presenter
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockPresenter: RepoInteractorOutput {
        
        var getRepoDetailsSuccededCalled = false
        
        var getRepoDetailsFailedCalled = false

        func getRepoDetailsSucceded(repoDetails: GFRepoDetails) {
            getRepoDetailsSuccededCalled = true
        }
        
        func getRepoDetailsFailed(message: String) {
            getRepoDetailsFailedCalled = true
        }
    }
}
