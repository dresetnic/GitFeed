//
//  GFRepoGFRepoInteractorOutput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import Foundation

protocol RepoInteractorOutput: class {
    func getRepoDetailsSucceded(repoDetails: GFRepoDetails)
    func getRepoDetailsFailed(message: String)
}
