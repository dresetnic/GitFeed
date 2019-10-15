//
//  GFEvent.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation

public struct GFEvent {
    
    let idKey: String
    let typeKey: String
    
    let actor: GFActor
    let repo: GFRepo
    
    let isPublic: Bool
    let date: String
    
    init (with dictionary: Dictionary<String, AnyObject>){
        self.idKey = dictionary[Key.Event.idKey] as! String
        self.typeKey = dictionary[Key.Event.typeKey] as! String
        self.isPublic = dictionary[Key.Event.publicKey] as! Bool
        self.date = dictionary[Key.Event.dateCreateKey] as! String
        
        self.actor = GFActor(dictionary: dictionary[Key.Event.actorKey] as! Dictionary<String, AnyObject>)
        
        self.repo = GFRepo(dictionary: dictionary[Key.Event.repoKey] as! Dictionary<String, AnyObject>)
    }
    
    static let example = GFEvent(with: [
      "id": "10623670298",
      "type": "WatchEvent",
      "actor": [
        "id": 56018101,
        "login": "ChoseongHyeok",
        "display_login": "ChoseongHyeok",
        "gravatar_id": "",
        "url": "https://api.github.com/users/ChoseongHyeok",
        "avatar_url": "https://avatars.githubusercontent.com/u/56018101?"
      ],
      "repo": [
        "id": 215010469,
        "name": "ChoseongHyeok/CSH",
        "url": "https://api.github.com/repos/ChoseongHyeok/CSH"
      ],
      "payload": [
        "action": "started"
      ],
      "public": true,
      "created_at": "2019-10-14T10:32:42Z"
        ] as Dictionary<String, AnyObject>)
}

extension GFEvent {
    
    var action: String {
    
        var result =  ""
        
        for (idx, element) in typeKey.enumerated() {
            
            if element.isUppercase && idx > 0{
                result += " "
                result += element.lowercased()
            } else if idx == 0 {
                result += element.uppercased()
            } else {
                result += element.lowercased()
            }
        }
        return result
    }
}

extension GFEvent: Hashable{
    public func hash(into hasher: inout Hasher){
        hasher.combine(idKey)
    }

    public static func == (lhs: GFEvent, rhs: GFEvent) -> Bool {
        return lhs.idKey == rhs.idKey
    }
}
