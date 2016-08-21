//
//  NeonTransferUITests.swift
//  NeonTransferUITests
//
//  Created by Vinicius Minozzi on 8/17/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import XCTest

class NeonTransferUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testHomeViewHistoryButton() {
        let app = XCUIApplication()
        XCTAssertNotNil(app.buttons["HISTÓRICO DE ENVIOS"])
        XCTAssertTrue(app.childrenMatchingType(.Window).elementBoundByIndex(0).buttons["HISTÓRICO DE ENVIOS"].enabled)
    }
    
    func testHomeViewSendMoneyButton() {
        let app = XCUIApplication()
        XCTAssertNotNil(app.buttons["ENVIAR DINHEIRO"])
        XCTAssertTrue(app.childrenMatchingType(.Window).elementBoundByIndex(0).buttons["ENVIAR DINHEIRO"].enabled)
    }
    
    func testNumbersOfContactsOnTableView() {
        let app = XCUIApplication()
        app.buttons["ENVIAR DINHEIRO"].tap()
        XCTAssertEqual(app.tables.count, 1)
        let table = app.tables.elementBoundByIndex(0)
        XCTAssertTrue(table.enabled)
        let expectedNumberOfElements: UInt = 15
        XCTAssertEqual(table.cells.count, expectedNumberOfElements)
    }
    
    func testHistoryView() {
        let app = XCUIApplication()
        app.buttons["HISTÓRICO DE ENVIOS"].tap()
        XCTAssertEqual(app.tables.count, 1)
        let table = app.tables.elementBoundByIndex(0)
        XCTAssertTrue(table.enabled)
    }
    
    func testHomeView() {
        let app = XCUIApplication()
        XCTAssertNotNil(app.buttons["HISTÓRICO DE ENVIOS"])
        XCTAssertTrue(app.childrenMatchingType(.Window).elementBoundByIndex(0).buttons["HISTÓRICO DE ENVIOS"].enabled)
        
        app.buttons["HISTÓRICO DE ENVIOS"].tap()
        XCTAssertEqual(app.tables.count, 1)
    }

}
