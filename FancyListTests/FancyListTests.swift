//
//  FancyListTests.swift
//  FancyListTests
//
//  Created by Larry Mcdowell on 2/27/21.
//

import XCTest

class FancyListTests: XCTestCase {

    var testStub: TestStub!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        testStub = TestStub()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testStub = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        testStub.addThese(first: 5, second: 9)
        XCTAssertEqual(14, testStub.total)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
           var hmm = testStub.multiplyIt(first: 3, second: 5)
        }
    }

}
