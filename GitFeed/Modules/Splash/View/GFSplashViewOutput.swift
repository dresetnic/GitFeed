//
//  SplashGFSplashViewOutput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 04/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

protocol SplashViewOutput {

    /**
        @author Dragos Resetnic
        Notify presenter that view is ready
    */

    func viewIsReady()
    func present()
    func dismiss(completion: @escaping () -> Void)
    
}
