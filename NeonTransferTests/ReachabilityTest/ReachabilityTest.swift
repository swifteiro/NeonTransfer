//
//  ReachabilityTest.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/19/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import XCTest
@testable import NeonTransfer

class ReachabilityTest: XCTestCase {
    
    func testConnectedToNetwork() {
        XCTAssertTrue(Reachability.isConnectedToNetwork())
    }
}
