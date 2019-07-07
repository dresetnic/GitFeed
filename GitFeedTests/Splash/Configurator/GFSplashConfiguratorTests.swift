//
//  GFSplashGFSplashConfiguratorTests.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 04/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import XCTest

class SplashModuleConfiguratorTests: XCTestCase {

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
        let viewController = SplashViewControllerMock()
        let configurator = SplashModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "SplashViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SplashPresenter, "output is not SplashPresenter")

        let presenter: SplashPresenter = viewController.output as! SplashPresenter
        XCTAssertNotNil(presenter.view, "view in SplashPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SplashPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SplashRouter, "router is not SplashRouter")

        let interactor: SplashInteractor = presenter.interactor as! SplashInteractor
        XCTAssertNotNil(interactor.output, "output in SplashInteractor is nil after configuration")
    }

    class SplashViewControllerMock: SplashViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
