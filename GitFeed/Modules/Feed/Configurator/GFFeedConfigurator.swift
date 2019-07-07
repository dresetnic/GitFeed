//
//  GFFeedGFFeedConfigurator.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class FeedModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FeedViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FeedViewController) {

        let router = FeedRouter()

        let presenter = FeedPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FeedInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
