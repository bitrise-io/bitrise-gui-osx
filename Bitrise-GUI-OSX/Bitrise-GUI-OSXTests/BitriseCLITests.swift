//
//  BitriseCLITests.swift
//  Bitrise-GUI-OSX
//
//  Created by Viktor Benei on 07/11/15.
//  Copyright © 2015 bitrise. All rights reserved.
//

import XCTest
@testable import Bitrise_GUI_OSX

class BitriseCLITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVersion() {
        let bitriseCLI = BitriseCLI()
        XCTAssertEqual("1.2.4\n", bitriseCLI.version())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
