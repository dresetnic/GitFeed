//
//  RepoGFRepoViewInput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//
import Foundation
protocol RepoViewInput: class {

    /**
        @author Dragos Resetnic
        Setup initial state of the view
    */

    func showHud()
    func hideHud()
    func showError(error: String)
    func reloadTableView()
    
    func setupInitialState()
    func showShareButton()
    func showShareActivity(url: URL)
}
