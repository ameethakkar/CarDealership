//
//  VehicleTests.swift
//  CoxAutomotiveTests
//
//  Created by Thakkar, Amee on 4/18/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import XCTest
@testable import CoxAutomotive

class VehicleTests: XCTestCase {

    private let vehicle = Data("""
{
    "vehicleId":1730213517,
    "year":2004,
    "make":"MINI",
    "model":"Cooper",
    "dealerId":1946227267
}
""".utf8)
    
    let dataHelper = DataHelper()
    
    func testDecoding_whenMissingVehicleId_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("vehicleId", decoding: Vehicle.self, from: try! vehicle.json(deletingKeyPaths: "vehicleId"))
    }
    
    func testDecoding_whenMissingYear_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("year", decoding: Vehicle.self, from: try! vehicle.json(deletingKeyPaths: "year"))
    }
    
    func testDecoding_whenMissingMake_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("make", decoding: Vehicle.self, from: try! vehicle.json(deletingKeyPaths: "make"))
    }
    
    func testDecoding_whenMissingModel_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("model", decoding: Vehicle.self, from: try! vehicle.json(deletingKeyPaths: "model"))
    }
    
    func testDecoding_whenMissingDealerId_itThrows() {
        dataHelper.AssertThrowsKeyNotFound("dealerId", decoding: Vehicle.self, from: try! vehicle.json(deletingKeyPaths: "dealerId"))
    }
}
