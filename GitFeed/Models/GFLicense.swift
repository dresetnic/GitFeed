//
//  GFLicense.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation

public struct GFLicense{
    
    let name: String
    let spdxId: String
    
    init(dictionary: Dictionary<String, AnyObject>) {
        self.name = dictionary[Key.License.nameKey] as! String
        self.spdxId = dictionary[Key.License.spdxIdKey] as! String
    }
}
