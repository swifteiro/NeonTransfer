//
//  UserTest.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/19/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import XCTest
@testable import NeonTransfer

class UserTest: XCTestCase {
    
    func testSetUser()  {
        User.sharedInstance.setUser(["name" : "Vinicius", "email" : "vin.minozzi@gmail.com", "token" : "tokenTest", "picture" : "img_profile"])
        XCTAssertNotNil(User.sharedInstance.name)
    }
    
    func testIfFirstAccess()  {
        XCTAssertFalse(User.isFirstAccess())
    }
    
    func testGetTokenFromUserDefaults() {
        XCTAssertNotNil(User.getTokenFromUserDefaults())
    }
}
