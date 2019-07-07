//
//  GFFeedGFFeedInitializer.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class FeedModuleInitializer: NSObject {
    
    @IBOutlet weak var feedViewController: FeedViewController!

    override func awakeFromNib() {

        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: feedViewController)
    }

    convenience init(feedViewController: FeedViewController) {
        self.init()
        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: feedViewController)
    }
}
