    //
//  GFRepoDetails.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import UIKit
    
public struct GFRepoDetails{
    let id: Int
    let name: String
    let fullName: String
    
    let nodeId: String
    var description: String = ""
    
    var stars: Int = 0
    var language: String?
    
    var subscribers: Int = 0
    var watchers: Int = 0
    var license: GFLicense?
    
    var openIssues: Int? = nil
    var forks: Int? = nil
    
    let htmlUrl: String
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        self.id = dictionary[Key.RepoDetails.idKey] as! Int
        self.name = dictionary[Key.RepoDetails.nameKey] as! String
        self.fullName = dictionary[Key.RepoDetails.fullNameKey] as! String
        self.htmlUrl = dictionary[Key.RepoDetails.htmlUrlKey] as! String
        
        self.nodeId = dictionary[Key.RepoDetails.nodeIdKey] as! String
        
        if let description = dictionary[Key.RepoDetails.descriptionKey] as? String {
        self.description = description
        }
        
        self.stars = dictionary[Key.RepoDetails.stargazersKey] as! Int
        
        if let language = dictionary[Key.RepoDetails.languageKey] as? String{
        self.language = language
        }
        
        self.subscribers = dictionary[Key.RepoDetails.subscribersKey] as! Int
        self.watchers = dictionary[Key.RepoDetails.watchersKey] as! Int
        
        if let licenseDictionary = dictionary[Key.RepoDetails.licenseKey] as? Dictionary<String, AnyObject>{
            self.license = GFLicense(dictionary: licenseDictionary)
        }
        
        if let issuesCount = dictionary[Key.RepoDetails.openIssuesKey] as? Int{
            self.openIssues = issuesCount
        }
        
        if let forksCount = dictionary[Key.RepoDetails.forksKey] as? Int{
            self.forks = forksCount
        }
    }
    
    init(){
        id = 0
        name = ""
        fullName = ""
        nodeId = ""
        htmlUrl = ""
    }
    
}

    
    extension GFRepoDetails {
        
        func oneLineInfoArray() -> [(UIColor, String)]{
            var infoArray:[(UIColor, String)] = []
            
            if let license = license {
                let text = "License: \(license.spdxId)"
                let color = UIColor.orange
                
                infoArray.append((color, text))
            }
            
            if let language = language {
                let text = "Language: \(language)"
                let color = UIColor.blue
                
                infoArray.append((color, text))
            }
            
            if let openIssues = openIssues {
                let text = "Open issues: \(openIssues)"
                let color = openIssues == 0 ? UIColor.green : .red
                
                infoArray.append((color, text))
            }
            
            if let forksCounter = forks {
                let text = "Forks: \(forksCounter)"
                let color = UIColor.purple
                
                infoArray.append((color, text))
            }
            
            return infoArray
        }
    }
    
