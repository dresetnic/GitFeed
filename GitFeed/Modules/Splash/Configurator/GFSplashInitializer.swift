//
//  GFSplashGFSplashInitializer.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 04/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class SplashModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var splashViewController: SplashViewController!

    override func awakeFromNib() {

        let configurator = SplashModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: splashViewController)
    }

	    convenience init(splashViewController: SplashViewController) {
        self.init()
        let configurator = SplashModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: splashViewController)
    }


}
