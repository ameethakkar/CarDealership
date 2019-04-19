//
//  DealershipTests.swift
//  CoxAutomotiveTests
//
//  Created by Thakkar, Amee on 4/17/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import XCTest
@testable import CoxAutomotive

class DealershipTests: XCTestCase {
    
    private let dealer = Data("""
{
    "dealerId": 23234,
    "name": "string"
}
""".utf8)
    let dataHelper = DataHelper()
    
    
    func testDecoding_whenMissingName_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("name", decoding: Dealership.self, from: try! dealer.json(deletingKeyPaths: "name"))
    }
    
    func testDecoding_whenMissingID_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("dealerId", decoding: Dealership.self, from: try! dealer.json(deletingKeyPaths: "dealerId"))
    }
    
}


