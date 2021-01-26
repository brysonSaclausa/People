//
//  PeopleUITests.swift
//  PeopleUITests
//
//  Created by BrysonSaclausa on 9/23/20.
//

import XCTest

class PeopleUITests: XCTestCase {
    var app: XCUIApplication! = nil
    
    var brysonCell: XCUIElement {
        return app.tables.cells.staticTexts["Bryson"]
    }
    
    
    override func setUpWithError() throws {
      
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
       
    }

    override func tearDownWithError() throws {
        
    }

    func testTableViewCellBryson() throws {
        
        XCTAssertTrue(brysonCell.isHittable)
        brysonCell.tap()
    }

    func testBrysonDetailViewLikeButton() throws {
        try testTableViewCellBryson()
        XCTAssertTrue(XCUIApplication().buttons["love"].isHittable)
        //XCUIApplication().buttons["love"].tap()
       
        
    }
    
    func testDetailViewBackButton() throws {
        try testBrysonDetailViewLikeButton()
        XCTAssertTrue(XCUIApplication().navigationBars["People.DetailView"].buttons["People"].isHittable)
        XCUIApplication().navigationBars["People.DetailView"].buttons["People"].tap()
    }
    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
