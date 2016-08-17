//
//  TransferTest.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import XCTest

@testable import NeonTransfer
@testable import JSONHelper

class TransferTest: XCTestCase {
    
    func testSerializeObj()  {
        let obj :Dictionary = ["ClienteId" : "1", "Token" : "tokenTest", "Valor" : 10.50, "Data" : NSDate()]
        var transfer :TransfersModel?
        transfer <-- obj
        XCTAssertNotNil(transfer)
    }
}
