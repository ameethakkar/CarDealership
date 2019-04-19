//
//  Vehicle.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import Foundation

public struct Vehicle: Decodable {
    let vehicleId: Int
    let model: String
    let make: String
    let year: Int
    let dealerId: Int
    
    enum CodingKeys: String, CodingKey {
        case vehicleId
        case model
        case make
        case year
        case dealerId
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vehicleId = try values.decode(Int.self, forKey: .vehicleId)
        model = try values.decode(String.self, forKey: .model)
        make = try values.decode(String.self, forKey: .make)
        year = try values.decode(Int.self, forKey: .year)
        dealerId = try values.decode(Int.self, forKey: .dealerId)
    }
}

