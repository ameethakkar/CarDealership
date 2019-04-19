//
//  DataRequest.swift
//  CoxAutomotive
//
//  Created by Thakkar, Amee on 4/13/19.
//  Copyright © 2019 Thakkar, Amee. All rights reserved.
//

import Foundation
import Alamofire

class HTTPRequestManager {
    
    func apiRequest(with apiURL: URL, httpMethod: HTTPMethod, parameters: Parameters = [:], paramEncoding: ParameterEncoding = JSONEncoding.default, httpHeaders: HTTPHeaders = [:], completionHandler: @escaping (DataResponse<Data>) -> Void ){
        Alamofire.request(apiURL, method: httpMethod, parameters: nil, encoding: paramEncoding, headers: httpHeaders).responseData(completionHandler: { (response) in
            completionHandler(response)
        })
    }
}
