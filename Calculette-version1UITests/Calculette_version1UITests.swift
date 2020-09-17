//
//  Calculette_version1UITests.swift
//  Calculette-version1UITests
//
//  Created by macmini-Armelle on 15/09/2020.
//  Copyright © 2020 armellelecerf. All rights reserved.
//

import XCTest

class Calculette_version1UITests: XCTestCase {
    var app: XCUIApplication!
    
    /// Reset state before each test method in a test case is called
    override func setUp() {
        // Init of app
        app = XCUIApplication()
        app.launch()
    }
    
    /// Testing the button 0
    func testButton0() {
        // When
        app.buttons["0"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "0")
    }
    
    func testButton4() {
        // When
        app.buttons["4"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "4")
    }

    func testButton6() {
        // When
        app.buttons["6"].tap()

        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "6")
    }
    
    func testButtonReset() {
        // When
        app.buttons["3"].tap()
        app.buttons["AC"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, " ")
    }
    
    func testButtonEqual() {
        // When
        app.buttons["4"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "7.0")
    }

}
