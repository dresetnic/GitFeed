//
//  GFNavigationModule.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation
import UIKit

public class GFNavigationModule: NSObject {
        
    static let shared = GFNavigationModule()
    
    var navigationController = UINavigationController()
    var appWindow: UIWindow? = nil
    
    override init() {
        super.init()
        
        showSplash()
        showFeed()
    }
    
    func showSplash(){
        let splashViewController = SplashViewController()
        let _ = SplashModuleInitializer(splashViewController: splashViewController)
        
        splashViewController.output.present()
        
        let delay: TimeInterval = 2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            
            splashViewController.output.dismiss {
                splashViewController.output = nil
            }
        }
    }
    
    func showFeed(){
        let feedViewController = FeedViewController()
        let _ = FeedModuleInitializer(feedViewController: feedViewController)
        
        self.navigationController.pushViewController(feedViewController, animated: false)
    }
    
    func showRepo(with repo: GFRepo){
        let repoViewController = RepoViewController()
        let _ = RepoModuleInitializer(repoViewController: repoViewController, repo: repo)
        
        self.navigationController.pushViewController(repoViewController, animated: true)
    }
}
