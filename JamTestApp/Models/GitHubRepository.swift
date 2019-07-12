//
//  GitHubRepository.swift
//  JamTestApp
//
//  Created by Korisnik on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation

class GitHubRepository {
    
    var name: String
    var owner: String
    var size: Int
    var hasWiki: Bool
    
    init(name: String, owner: String, size: Int, hasWiki: Bool) {
        self.name = name
        self.owner = owner
        self.size = size
        self.hasWiki = hasWiki
    }
    
    func setName(newName: String) {
        self.name = newName
    }
}
