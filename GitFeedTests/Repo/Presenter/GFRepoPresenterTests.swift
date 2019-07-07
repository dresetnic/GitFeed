//
//  GFRepoGFRepoPresenterTests.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import XCTest

class RepoPresenterTest: XCTestCase {
    
    let presenter = RepoPresenter()
    let view = MockViewController()
    let router = MockRouter()
    let interactor = MockInteractor()
    
    override func setUp() {
        super.setUp()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.methodWasCalled = false
        interactor.methodWasCalled = false
    }
    
    override func tearDown() {
        view.methodWasCalled = false
        interactor.methodWasCalled = false

        super.tearDown()
    }
    
    func testShowHud(){
        presenter.view.showHud()
        
        XCTAssertTrue(view.methodWasCalled, "Should call showHud")
    }
    
    func testHideHud(){
        presenter.view.hideHud()
        
        XCTAssertTrue(view.methodWasCalled, "Should call hideHud")
    }
    
    func testShowErrorMessage(){
        let message = "Test Message"
        presenter.view.showError(error: message)
        
        XCTAssertTrue(message == view.errorMessage, "Message text should be: \(message)")
    }
    
    func testShowError(){
        presenter.view.showError(error: "")
        
        XCTAssertTrue(view.methodWasCalled, "Should call showError")
    }
    
    func testReloadTableView(){
        presenter.view.reloadTableView()
        XCTAssertTrue(view.methodWasCalled, "Should call reloadTableView")
    }
    
    func testShowShareButton(){
        presenter.view.showShareButton()
        XCTAssertTrue(view.methodWasCalled, "Should call showShareButton")
    }
    
    func testShowShareActivity(){
        presenter.view.showShareActivity(url: URL(string: "www.apple.com")!)
        XCTAssertTrue(view.methodWasCalled, "Should call showShareActivity")
    }
    
    func testSetupInitialState(){
        presenter.view.setupInitialState()
        XCTAssertTrue(view.methodWasCalled, "Should call setupInitialState")
    }
    
    func testGetRepoDetails(){
        presenter.interactor.getRepoDetails(repoName: "Fun")
        XCTAssertTrue(interactor.methodWasCalled, "Should call getRepoDetails")
    }
    
    class MockInteractor: RepoInteractorInput {
        
        var methodWasCalled = false
        
        func getRepoDetails(repoName: String){
            methodWasCalled = true
        }
    }
    
    class MockRouter: RepoRouterInput {
    }
    
    class MockViewController: RepoViewInput {
        
        var errorMessage = ""
        var methodWasCalled = false
        
        func showHud() {
            methodWasCalled = true
        }
        
        func hideHud() {
            methodWasCalled = true
        }
        
        func showError(error: String) {
            errorMessage = error
            methodWasCalled = true
        }
        
        func reloadTableView() {
            methodWasCalled = true
        }
        
        func showShareButton() {
            methodWasCalled = true
        }
        
        func showShareActivity(url: URL) {
            methodWasCalled = true
        }
        
        func setupInitialState() {
            methodWasCalled = true
        }
    }
}
