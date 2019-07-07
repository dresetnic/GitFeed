//
//  GFRepoGFRepoViewTests.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import XCTest

class RepoViewTests: XCTestCase {
    
    let view = RepoViewController()
    let presenter = MockPresenter()
    
    override func setUp() {
        super.setUp()
        
        view.output = presenter
        
        presenter.methodWasCalled = false
    }
    
    override func tearDown() {
        presenter.methodWasCalled = false
        super.tearDown()
    }
    
    func testViewIsReady(){
        view.output.viewIsReady()
        XCTAssertTrue(presenter.methodWasCalled, "Should call viewIsReady")
    }
    
    func testTouchedShareButton(){
        view.output.touchedShareButton()
        XCTAssertTrue(presenter.methodWasCalled, "Should call touchedShareButton")
    }
    
    func testNumberOfSections(){
        presenter.numberOfSections()
        XCTAssertTrue(presenter.methodWasCalled, "Should call numberOfSections")
    }
    
    func testNumberOfRepoInfoFieldss(){
        presenter.numberOfRepoInfoFields(for: 0)
        XCTAssertTrue(presenter.methodWasCalled, "Should call numberOfRepoInfoFields")
    }
    
    func testRepoInfo(){
        presenter.repoInfo()
        XCTAssertTrue(presenter.methodWasCalled, "Should call repoInfo")
    }
    
    func testInfoCellHeightFor(){
        presenter.infoCellHeightFor(0, section: 0)
        XCTAssertTrue(presenter.methodWasCalled, "Should call infoCellHeightFor")
    }
    
    func testInfoForLineCell(){
        presenter.infoForLineCell(at: 0)
        XCTAssertTrue(presenter.methodWasCalled, "Should call infoForLineCell")
    }

    class MockPresenter: RepoViewOutput {
        
        var methodWasCalled = false
        
        func viewIsReady() {
            methodWasCalled = true
        }
        
        func touchedShareButton() {
            methodWasCalled = true
        }
        
       @discardableResult func numberOfSections() -> Int {
            methodWasCalled = true
            return 0
        }
        
       @discardableResult func numberOfRepoInfoFields(for section: Int) -> Int {
            methodWasCalled = true
            return 0
        }
        
        @discardableResult func repoInfo() -> GFRepoDetails {
            methodWasCalled = true
            return GFRepoDetails()
        }
        
        @discardableResult func infoCellHeightFor(_ row: Int, section: Int) -> CGFloat {
            methodWasCalled = true
            return 0
        }
        
        @discardableResult func infoForLineCell(at index: Int) -> (UIColor, String) {
            methodWasCalled = true
            return (UIColor.white, "")
        }
    }
}
