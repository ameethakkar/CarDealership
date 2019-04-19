//
//  VehicleViewController.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController {

    static var identifier = "VehicleViewController"
    var vehicleList : [Vehicle] = []
    
    @IBOutlet weak var vehicleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vehicleTableView.delegate = self
        vehicleTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Vehicles"
    }
}

extension VehicleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell", for: indexPath) as? VehicleTableViewCell
        
        let vehicle = vehicleList[indexPath.row]
        cell?.makeLabel.text = vehicle.make
        cell?.modelLabel.text = vehicle.model
        cell?.vehicleIdLabel.text = String(vehicle.vehicleId)
        cell?.yearLabel.text = String(vehicle.year)
        cell?.dealerIdLabel.text = String(vehicle.dealerId)
        
        return cell!
    }
}

extension VehicleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
