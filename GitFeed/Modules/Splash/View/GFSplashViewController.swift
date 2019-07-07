//
//  SplashGFSplashViewController.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 04/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController, SplashViewInput {

    var output: SplashViewOutput!

    var backgroundImageView = UIImageView()
    var logoImageView = UIImageView()
    
    var logoIsHidden: Bool = false
    static let logoImageBig: UIImage = UIImage(named: "Icon")!

    // MARK: Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: SplashViewInput
    func setupInitialState() {
        self.addSubviews()
        self.setupConstraints()
        self.setupViews()
    }
    
    func addSubviews(){
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(logoImageView)
    }
    
    func setupConstraints(){
        self.backgroundImageView.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
        
        self.logoImageView.snp.makeConstraints { (make) in
            make.center.equalTo(backgroundImageView)
            make.height.width.equalTo(160)
        }
    }
    
    func setupViews(){
        logoImageView.image = UIImage(named: "Icon")
        logoImageView.contentMode = .scaleAspectFit
        backgroundImageView.backgroundColor = .white
    }
}
