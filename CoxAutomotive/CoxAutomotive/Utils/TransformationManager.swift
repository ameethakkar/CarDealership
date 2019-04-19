//
//  TransformationManager.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/15/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import Foundation
import Alamofire

class TransformationManager {
    
    private let jsonDecoder = JSONDecoder()
    
    func transformResponseIntoObject<T:Decodable>(with response: DataResponse<Data>, objectType: T.Type) -> T? {
        
        guard let data = response.data else{
            return nil
        }
        do {
            return try jsonDecoder.decode(objectType, from: data) as T
        } catch let error as NSError {
            debugPrint(error.debugDescription)
        }
        
        return nil
    }
}
