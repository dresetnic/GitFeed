//
//  RepoGFRepoPresenter.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit

enum InfoSectionType: Int{
    case general = 0, oneFieldFact
}

class RepoPresenter: RepoModuleInput, RepoViewOutput, RepoInteractorOutput {
    
    weak var view: RepoViewInput!
    var interactor: RepoInteractorInput!
    var router: RepoRouterInput!
    
    var repo: GFRepo!
    var repoDetails: GFRepoDetails!
    
    var oneLineCellInfoArray: [(UIColor, String)]!
    
    func viewIsReady() {
        self.view.setupInitialState()
        self.view.showHud()
        self.interactor.getRepoDetails(repoName: repo.name)
    }
    
    func touchedShareButton(){
        self.view.showShareActivity(url: URL(string: repoDetails.htmlUrl)!)
    }
    
    func getRepoDetailsSucceded(repoDetails: GFRepoDetails){
        self.view.hideHud()
        self.repoDetails = repoDetails
        self.oneLineCellInfoArray = repoDetails.oneLineInfoArray()
        self.view.reloadTableView()
        self.view.showShareButton()
    }
    
    func getRepoDetailsFailed(message: String){
        self.view.hideHud()
        self.view.showError(error: message)
    }
    
    func numberOfRepoInfoFields(for section: Int) -> Int {
        if self.repoDetails != nil{
            let sectionType = InfoSectionType(rawValue: section)!
            
            switch sectionType {
            case .general:
                return 1
            case .oneFieldFact:
                return oneLineCellInfoArray.count
            }
        } else {
            return 0
        }
    }
    
    func repoInfo() -> GFRepoDetails {
        return self.repoDetails
    }
    
    func infoCellHeightFor(_ row: Int, section: Int) -> CGFloat {
        let sectionType = InfoSectionType(rawValue: section)!
        
        switch sectionType {
        case .general:
            return 250
        case .oneFieldFact:
            return 40
        }
    }
    
    func numberOfSections() -> Int{
        if self.repoDetails != nil{
            return 2
        } else {
            return 0
        }
    }
    
    func infoForLineCell(at index: Int) -> (UIColor, String){
        return oneLineCellInfoArray[index]
    }
    
}
