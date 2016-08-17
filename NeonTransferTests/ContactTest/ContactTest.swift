//
//  ContactTest.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import XCTest
@testable import NeonTransfer
@testable import JSONHelper

class ContactTest: XCTestCase {
    
    func testSerializeObj()  {
        let obj :Dictionary = ["id" : "1", "name" : "vinicius", "phone" : "69696969", "picture" : "img.png"]
        var contact :Contact?
        contact <-- obj
        XCTAssertNotNil(contact)
    }
    
    func testJSONParsingFromFile()  {
        XCTAssertNotNil(Contact.jsonParsingFromFile())
    }
    
}
