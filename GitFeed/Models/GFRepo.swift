//
//  GFRepo.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 28/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation

public struct GFRepo{
    
    let id: Int
    let name: String
    let url: String
    
    init(dictionary: Dictionary<String, AnyObject>) {
        self.id = dictionary[Key.Repo.idKey] as! Int
        self.name = dictionary[Key.Repo.nameKey] as! String
        self.url = dictionary[Key.Repo.urlKey] as! String
    }
}


extension GFRepo {
    
    static func mockObject() -> GFRepo{
        
        let dictionary = ["id": 78010502,
                                "name": "saschagrunert/rain",
                                "url": "https://api.github.com/repos/saschagrunert/rain"] as [String : AnyObject]
        return GFRepo(dictionary: dictionary)
    }
    
}
