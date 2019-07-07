//
//  SplashGFSplashPresenter.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 04/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

class SplashPresenter: SplashModuleInput, SplashViewOutput, SplashInteractorOutput {

    weak var view: SplashViewInput!
    var interactor: SplashInteractorInput!
    var router: SplashRouterInput!

    private lazy var animator: SplashAnimatorDescription = SplashAnimator(foregroundSplashWindow: foregroundSplashWindow,
                                                                          backgroundSplashWindow: backgroundSplashWindow)
    
    private lazy var foregroundSplashWindow: UIWindow = {
        
        let viewController = view as! SplashViewController
        let splashWindow = self.splashWindow(windowLevel: .normal + 1, rootViewController: viewController)
        
        return splashWindow
    }()
    
    private lazy var backgroundSplashWindow: UIWindow = {
        let splashViewController = view as! SplashViewController
        let splashWindow = self.splashWindow(windowLevel: .normal - 1, rootViewController: splashViewController)
        
        return splashWindow
    }()
    
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    private func splashWindow(windowLevel: UIWindow.Level, rootViewController: SplashViewController?) -> UIWindow {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)
        
        splashWindow.windowLevel = windowLevel
        splashWindow.rootViewController = rootViewController
        
        return splashWindow
    }
    
    // MARK: - SplashPresenterDescription
    
    func present() {
        animator.animateAppearance()
    }
    
    func dismiss(completion: @escaping () -> Void) {
        animator.animateDisappearance(completion: completion)
    }
}
