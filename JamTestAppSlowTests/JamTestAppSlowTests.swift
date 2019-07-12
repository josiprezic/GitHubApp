//
//  JamTestAppSlowTests.swift
//  JamTestAppSlowTests
//
//  Created by Josip Rezic on 12/07/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import XCTest
@testable import JamTestApp

class JamTestAppSlowTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidCallToGithubApi() {
        // given
        let promise = expectation(description: "Status code 200")
        
        // when
        GithubApi.getListOfGithubRepositories(forQuery: "tetris") { (success, message, data) in
            //then
            if message != "Success" {
                XCTFail(message)
            } else {
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5)
    }
    
    

}
