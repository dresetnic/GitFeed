//
//  RepoGFRepoViewOutput.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

protocol RepoViewOutput {

    /**
        @author Dragos Resetnic
        Notify presenter that view is ready
    */

    func viewIsReady()
    func touchedShareButton()
    
    func numberOfSections() -> Int
    func numberOfRepoInfoFields(for section: Int) -> Int
    func repoInfo()->GFRepoDetails
    func infoCellHeightFor(_ row: Int, section: Int) -> CGFloat
    func infoForLineCell(at index: Int) -> (UIColor, String)
}
