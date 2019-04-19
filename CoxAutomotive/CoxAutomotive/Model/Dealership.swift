//
//  Dealership.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import Foundation

public struct Dealership: Codable {
    let name: String
    let dealerId: Int
    var dealerVehicles: [Vehicle] = [Vehicle]()
    
    enum CodingKeys: String, CodingKey {
        case name
        case dealerId
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        dealerId = try values.decode(Int.self, forKey: .dealerId)
    }
}

public struct DataSetID: Codable {
    let datasetId: String
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        datasetId = try values.decode(String.self, forKey: .datasetId)
    }
    
    init(setId: String) {
        datasetId = setId
    }
}

public struct VehicleIDs: Codable {
    var vehicleIds: [Int]
    
    init(){
        vehicleIds = [Int]()
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vehicleIds = try values.decode([Int].self, forKey: .vehicleIds)
    }
}
