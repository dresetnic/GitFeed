//
//  GFRepoGFRepoConfiguratorTests.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import XCTest

class RepoModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = RepoViewControllerMock()
        let configurator = RepoModuleConfigurator()
        let repoMock = GFRepo.mockObject()

        //when
        configurator.configure(viewController: viewController, repo: repoMock)

        //then
        XCTAssertNotNil(viewController.output, "RepoViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RepoPresenter, "output is not RepoPresenter")

        let presenter: RepoPresenter = viewController.output as! RepoPresenter
        XCTAssertNotNil(presenter.view, "view in RepoPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RepoPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RepoRouter, "router is not RepoRouter")

        let interactor: RepoInteractor = presenter.interactor as! RepoInteractor
        XCTAssertNotNil(interactor.output, "output in RepoInteractor is nil after configuration")
    }

    class RepoViewControllerMock: RepoViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
