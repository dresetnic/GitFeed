//
//  GFSplashGFSplashConfigurator.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 04/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class SplashModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SplashViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SplashViewController) {

        let router = SplashRouter()

        let presenter = SplashPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SplashInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
