//
//  VehicleViewControllerTests.swift
//  CoxAutomotiveTests
//
//  Created by Thakkar, Amee on 4/17/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import XCTest
@testable import CoxAutomotive

class VehicleViewControllerTests: XCTestCase {

    var controller: VehicleViewController!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!
    var dataSource: UITableViewDataSource!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: VehicleViewController.self))
        guard let vehicleVC = storyboard.instantiateViewController(withIdentifier: VehicleViewController.identifier) as? VehicleViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        
        controller = vehicleVC
        controller.loadViewIfNeeded()
        tableView = controller.vehicleTableView
        delegate = tableView.delegate
        dataSource = tableView.dataSource
    }
    
    override func tearDown() {
        controller = nil
        tableView = nil
        delegate = nil
        dataSource = nil
    }
    
    func testInitTableView() {
        
        XCTAssertNotNil(tableView, "TableView is missing")
    }
    
    func testTableViewHasCells() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell")
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'DealerCell'")
    }
    
    func testThatTableViewHasDataSource() {
        XCTAssertNotNil(controller.vehicleTableView.dataSource, "Table datasource cannot be nil")
    }
    
    func testTableViewDelegateIsViewController() {
        XCTAssertTrue(tableView.delegate === controller, "Controller should be delegate for the table view")
    }
    
}
