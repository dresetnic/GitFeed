//
//  GFKeys.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import Foundation

let defaultItemsPerPage = 30

struct Key {
    
    struct Event {
        static let idKey = "id"
        static let typeKey = "type"
        
        static let actorKey = "actor"
        
        static let repoKey = "repo"
        
        static let payloadKey = "payload"
        
        static let publicKey = "public"
        static let dateCreateKey = "created_at"
    }
    
    struct Actor {
        static let idKey = "id"
        static let loginKey = "login"
        static let displayLoginKey = "display_login"
        static let gravatarIdKey = "gravatar_id"
        static let urlKey = "url"
        static let avatarUrlKey = "avatar_url"
    }
    
    struct Repo  {
        static let idKey = "id"
        static let nameKey = "name"
        static let urlKey = "url"
    }
    
    struct RepoDetails {
        static let idKey = "id"

        static let nodeIdKey = "node_id"
        static let nameKey = "name"
        static let fullNameKey = "full_name"
        static let htmlUrlKey = "html_url"

        static let descriptionKey = "description"
        static let stargazersKey = "stargazers_count"
        static let languageKey = "language"

        static let subscribersKey = "subscribers_count"
        static let issuesKey = "open_issues_count"
        static let watchersKey = "watchers"
        
        static let licenseKey = "license"
        
        static let openIssuesKey = "open_issues"
        static let forksKey = "forks_count"
    }
    
    struct License {
        static let urlKey = "url"
        static let nameKey = "name"
        static let spdxIdKey = "spdx_id"
    }
}
