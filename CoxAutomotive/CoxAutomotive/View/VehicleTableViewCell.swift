//
//  VehicleTableViewCell.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var vehicleIdLabel: UILabel!
    @IBOutlet weak var dealerIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
