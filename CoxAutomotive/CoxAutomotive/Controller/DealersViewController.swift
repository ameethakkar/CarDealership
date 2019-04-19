//
//  DealersViewController.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import UIKit

class DealersViewController: UIViewController {

    static let identifier = "DealersViewController"
    var dealers : [Dealership] = Services.sharedManager.dealers
    var selectedIndex = 0
    
    @IBOutlet weak var dealersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealersTableView.dataSource = self
        dealersTableView.delegate = self
        dealersTableView.tableFooterView = UIView()
        debugPrint(dealers)
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Dealers"
    }
}

extension DealersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealerCell", for: indexPath) as? DealershipTableViewCell
        let dealer = dealers[indexPath.row]
        cell?.dealerNameLabel.text = dealer.name
        cell?.dealerIdLabel.text = String(dealer.dealerId)
        return cell!
    }
}

extension DealersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "DEALER_VEHICLES_SEGUE", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! VehicleViewController
        dest.vehicleList = self.dealers[selectedIndex].dealerVehicles
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
