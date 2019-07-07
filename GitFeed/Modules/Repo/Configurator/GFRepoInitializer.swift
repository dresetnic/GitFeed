//
//  GFRepoGFRepoInitializer.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class RepoModuleInitializer: NSObject {
    
    convenience init(repoViewController: RepoViewController, repo: GFRepo) {
        self.init()
        let configurator = RepoModuleConfigurator()
        configurator.configure(viewController: repoViewController, repo: repo)
    }
}
