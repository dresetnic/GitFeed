//
//  GFRepoGFRepoConfigurator.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class RepoModuleConfigurator {

    public func configure(viewController: RepoViewController, repo: GFRepo) {

        let router = RepoRouter()

        let presenter = RepoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RepoInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        presenter.repo = repo
    }

}
