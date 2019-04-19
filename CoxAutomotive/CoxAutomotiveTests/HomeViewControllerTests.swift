//
//  HomeViewControllerTests.swift
//  CoxAutomotiveTests
//
//  Created by Thakkar, Amee on 4/18/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import XCTest
@testable import CoxAutomotive

class HomeViewControllerTests: XCTestCase {
    
    var controller: HomeViewController!
    var exploreBtn: UIButton!
    var activityIndicator: UIActivityIndicatorView!

    override func setUp() {
        let homeStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: HomeViewController.self))
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: HomeViewController.identifier) as? HomeViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        controller = homeVC
        controller.loadViewIfNeeded()
        exploreBtn = controller.exploreButton
        activityIndicator = controller.activityIndicator
    }

    override func tearDown() {
        controller = nil
        exploreBtn = nil
        activityIndicator = nil
    }

    func testInitExploreButton() {
        XCTAssertNotNil(exploreBtn, "Explore button is missing")
    }
   
    func testInitActivityIndicator() {
        XCTAssertNotNil(activityIndicator, "Activity Indicator is missing")
    }
}
