//
//  HomeViewController.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import UIKit
import PromiseKit
import Lottie

class HomeViewController: UIViewController {

    static let identifier = "HomeViewController"
    @IBOutlet weak var exploreButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Services.sharedManager.getDataSet()
    }
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.isHidden = true
        exploreButton.isEnabled = true
    }
    @IBAction func exploreBtnClicked(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        exploreButton.isEnabled = false
        fetchDataVehicleIDFromServer()
    }
}

extension HomeViewController {
    
    func fetchDataVehicleIDFromServer() {
        _ = Services.sharedManager.getVehicleIds().then { (vids) -> Promise<[Vehicle]> in
            return Promise<[Vehicle]> { seal in
                var vehicles = [Vehicle]()
                let count = vids.vehicleIds.count
                for vd in vids.vehicleIds {
                    _ = Services.sharedManager.getVehicleData(vehicleId: vd).done({ (vehicle) in
                        vehicles.append(vehicle)
                        if(vehicles.count == count) {
                            seal.fulfill(vehicles)
                        }
                    })
                }
            }
        }.then({ (vehicles) -> Promise<([Dealership],[Vehicle])> in
            return Promise<([Dealership],[Vehicle])> { seal in
                var dealers = [Dealership]()
                var dealerIds = Set<Int>()
                for v in vehicles {
                    dealerIds.insert(v.dealerId)
                }
                let count = dealerIds.count
                for id in dealerIds {
                    _ = Services.sharedManager.getDealershipData(dealerId: id).done({ (dealer) in
                        dealers.append(dealer)
                        if(dealers.count == count) {
                            seal.fulfill((dealers,vehicles))
                        }
                    })
                }
            }
        }).then({ (result) -> Promise<[Dealership]> in
            return Promise<[Dealership]> { seal in
                var dealerMap = [Int:Dealership]()
                for d in  result.0 {
                    if(dealerMap[d.dealerId] == nil) {
                        dealerMap[d.dealerId] = d
                    }
                }
                for v in result.1 {
                    dealerMap[v.dealerId]?.dealerVehicles.append(v)
                }
                seal.fulfill(Array<Dealership>(dealerMap.values))
            }
        }).done({ [weak self] (dealerships) in
            Services.sharedManager.dealers = dealerships
            guard let this = self else { return }
            this.performSegue(withIdentifier: "DEALERS_SEGUE", sender: nil)
        }).catch({ [weak self] (error) in
            debugPrint(error.localizedDescription)
            guard let this = self else { return }
            this.activityIndicator.stopAnimating()
            this.exploreButton.isEnabled = true
            
        })
    }
    
}

