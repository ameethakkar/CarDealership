//
//  DealersViewControllerTests.swift
//  CoxAutomotiveTests
//
//  Created by Thakkar, Amee on 4/17/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import XCTest
@testable import CoxAutomotive

class DealersViewControllerTests: XCTestCase {

    var controller: DealersViewController!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!
    var dataSource: UITableViewDataSource!
    
    override func setUp() {
        let dealerStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: DealersViewController.self))
        guard let dealerVC = dealerStoryboard.instantiateViewController(withIdentifier: DealersViewController.identifier) as? DealersViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        
        controller = dealerVC
        controller.loadViewIfNeeded()
        tableView = controller.dealersTableView
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
    
    func testTableViewDelegateIsViewController() {
        XCTAssertTrue(controller.dealersTableView.delegate === controller,
                      "Controller should be delegate for the table view")
        
    }
    
    func testThatTableViewHasDataSource() {
        XCTAssertNotNil(controller.dealersTableView.dataSource, "Table datasource cannot be nil")
    }
    
    func testTableViewHasCells() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealerCell")
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'DealerCell'")
    }

}
