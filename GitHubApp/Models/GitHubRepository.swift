//
//  GitHubRepository.swift
//  GitHubApp
//
//  Created by Korisnik on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation

class GitHubRepository {
    
    let name: String
    let owner: String
    let size: Int
    let hasWiki: Bool
    
    init(name: String, owner: String, size: Int, hasWiki: Bool) {
        self.name = name
        self.owner = owner
        self.size = size
        self.hasWiki = hasWiki
    }
}
