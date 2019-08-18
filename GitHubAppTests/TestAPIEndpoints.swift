//
//  TestAPIEndpoints.swift
//  GitHubAppTests
//
//  Created by Korisnik on 18/08/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Quick
import Nimble
@testable import GitHubApp

class TestAPIEndpoints: QuickSpec {
    
    override func spec() {
        describe("testing GitHub API") {
            
            context("when fetching GitHub repositories with default query from GitHub API") {
                
                let apiMethod = GithubApi.getListOfGithubRepositories
                let defaultQuery = AppStrings.RepositoriesCollectionVC.defaultQuery
                let timeout = 5.0
                
                it("should return expected response before timeout") {
                    waitUntil(timeout: timeout) { done in
                        apiMethod(defaultQuery) { success, message, repos in
                            expect(success).to(equal(true))
                            expect(message).to(equal("Success"))
                            expect(repos as? [GitHubRepository]).toNot(beEmpty())
                            done()
                        }
                    }
                }
            }
        }
    }
}
