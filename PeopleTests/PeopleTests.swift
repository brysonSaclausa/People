//
//  PeopleTests.swift
//  PeopleTests
//
//  Created by BrysonSaclausa on 9/23/20.
//

import XCTest
@testable import People

class PeopleTests: XCTestCase {
    let peopleController = PeopleController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPeopleControllerCount() throws {
        
        XCTAssertEqual(peopleController.peopleArray.count, 2, "People count is not valid")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
