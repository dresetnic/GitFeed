//
//  GFRepoGFRepoInteractor.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import Foundation

class RepoInteractor: RepoInteractorInput {
    
    weak var output: RepoInteractorOutput!
    
    func getRepoDetails(repoName: String){
        GFNetworkManager.shared.getRepoDetails(name: repoName) {[weak self] (message, isSucces, repoDetails) in
            if isSucces {
                DispatchQueue.main.async {
                    self?.output.getRepoDetailsSucceded(repoDetails: repoDetails!)
                }
            } else {
                DispatchQueue.main.async {
                    self?.output.getRepoDetailsFailed(message: message)
                }
            }
        }
    }
}
