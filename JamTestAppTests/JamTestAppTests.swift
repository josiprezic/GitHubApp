//
//  JamTestAppTests.swift
//  JamTestAppTests
//
//  Created by Josip Rezic on 12/07/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import XCTest
@testable import JamTestApp

class JamTestAppTests: XCTestCase {
    
    var sut: GitHubRepository!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = GitHubRepository(name: "TestingRepo",
                               owner: "John Smith",
                               size: 1000,
                               hasWiki: true)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testNameIsChanged() {
        // 1. given
        let newName = "Testing Repo Name"
        
        // 2. when
        sut.setName(newName: newName)
        
        // 3. then
        XCTAssertEqual(sut.name, newName, "New name is not correct")
        XCTAssertTrue(sut.size > 0)
        
    }

}
