//
//  Services.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class Services {
    
    static let sharedManager = Services()
    private init(){}
    fileprivate var dataSetID = DataSetID(setId: "LJxWGH3A1gg")
    var vehicleIDList:VehicleIDs = VehicleIDs()
    var vehicles = [Vehicle]()
    var dealers = [Dealership]()
    fileprivate let httpManager = HTTPRequestManager()
    fileprivate let transformManager = TransformationManager()
    let baseUrl = "http://vautointerview.azurewebsites.net"
    
    func getDataSet() {
        let requestUrl = baseUrl + "/api/datasetId"
        guard let url = URL(string: requestUrl) else { return }
        
        httpManager.apiRequest(with: url, httpMethod: .get) { [unowned self](apiResponse) in
            guard let retrievedID = self.transformManager.transformResponseIntoObject(with: apiResponse, objectType: DataSetID.self) else {
                debugPrint("Failed to Retrieve ID from the server!!")
                return
            }
            self.dataSetID = retrievedID
            debugPrint("Retrieved the ID from the server!!")
            debugPrint(self.dataSetID.datasetId)
        }
    }
    
    func getVehicleIds() -> Promise<VehicleIDs>{
        return Promise<VehicleIDs> { seal in
            let requestUrl = baseUrl + "/api/\(dataSetID.datasetId)/vehicles"
            guard let url = URL(string: requestUrl) else {return seal.reject(NSError(
                domain: "PromiseKitTutorial",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                
            }
            
            httpManager.apiRequest(with: url, httpMethod: .get) { [unowned self](apiResponse) in
                guard let retrievedVehicleIDList = self.transformManager.transformResponseIntoObject(with: apiResponse, objectType: VehicleIDs.self) else {
                    debugPrint("Failed to Retrieve Vehicles IDs from the server!!")
                    return
                }
                debugPrint("Retrieved Vehicles IDs from the server!!")
                seal.fulfill(retrievedVehicleIDList)
            }
        }
    }
    
    func getVehicleData(vehicleId: Int) -> Promise<Vehicle>{

        return Promise<Vehicle> { seal in
            let requestUrl = baseUrl + "/api/\(dataSetID.datasetId)/vehicles/\(vehicleId)"
            guard let url = URL(string: requestUrl) else { return }
            httpManager.apiRequest(with: url, httpMethod: .get) { (apiResponse) in
                guard let retrievedVehicle = self.transformManager.transformResponseIntoObject(with: apiResponse, objectType: Vehicle.self) else {
                    debugPrint("Failed to Retrieve Vehicles from the server!!")
                    seal.reject(NSError(
                        domain: "PromiseKitTutorial",
                        code: 0,
                        userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                    return
                }
                debugPrint("Retrieved Vehicles from the server!!")
                seal.fulfill(retrievedVehicle)
            }
        }
    }

    func getDealershipData(dealerId: Int) -> Promise<Dealership>{
        
        return Promise<Dealership> { seal in
            let requestUrl = baseUrl + "/api/\(dataSetID.datasetId)/dealers/\(dealerId)"
            guard let url = URL(string: requestUrl) else { return }
            httpManager.apiRequest(with: url, httpMethod: .get) { (apiResponse) in
                guard let retrievedDealer = self.transformManager.transformResponseIntoObject(with: apiResponse, objectType: Dealership.self) else {
                    debugPrint("Failed to Retrieve Dealership from the server!!")
                    seal.reject(NSError(
                        domain: "PromiseKitTutorial",
                        code: 0,
                        userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                    return
                }
                debugPrint("Retrieved Dealership from the server!!")
                seal.fulfill(retrievedDealer)
            }
        }
    }
}
