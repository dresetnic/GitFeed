//
//  GFActor.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation

public struct GFActor{
    
    let id: Int
    let login: String
    let displayName: String
    let gravatarId: String
    let avatarUrl: String
    
    init(dictionary: Dictionary<String, AnyObject>){
        self.id = dictionary[Key.Actor.idKey] as! Int
        self.login = dictionary[Key.Actor.loginKey] as! String
        self.displayName = dictionary[Key.Actor.displayLoginKey] as! String
        self.gravatarId = dictionary[Key.Actor.gravatarIdKey] as! String
        self.avatarUrl = dictionary[Key.Actor.avatarUrlKey] as! String
    }
}
