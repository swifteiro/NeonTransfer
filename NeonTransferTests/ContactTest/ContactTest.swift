//
//  ContactTest.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import XCTest
@testable import NeonTransfer

class ContactTest: XCTestCase {
    
    
    func testJSONParsingFromFile()  {
        XCTAssertNotNil(Contact.jsonParsingFromFile())
    }
    
}
