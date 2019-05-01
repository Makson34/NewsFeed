//
//  TypicodeApiService.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias RequestJsonCompletion = (_ results: JSON? ,_ error: Error?) -> Void

class TypicodeApiService: NSObject {
    
    struct APIManager {
        static let sharedManager: SessionManager = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 20
            return SessionManager(configuration: configuration)
        }()
    }
    
    
    internal let host = "https://jsonplaceholder.typicode.com"
    
    internal func sendRequestWithJSONResponse(
        requestType: HTTPMethod,
        url: String,
        params: [String:AnyObject]?,
        headers: HTTPHeaders?,
        paramsEncoding: ParameterEncoding,
        completion: @escaping RequestJsonCompletion
        ){
        
        debugPrint(params as Any)
        
        var reqHeaders = HTTPHeaders()
        
        if headers != nil{
            reqHeaders = headers!
        }
        debugPrint(reqHeaders)
        
        APIManager.sharedManager.request(url as URLConvertible,
                                         method: requestType ,
                                         parameters: params,
                                         encoding: paramsEncoding,
                                         headers: reqHeaders
            ).responseJSON {(dataResponse) in
                debugPrint(dataResponse)
                
                switch dataResponse.result {
                case .success(let data):
                    let json = JSON(data)
                    debugPrint(json)
                    completion(json,nil)
                case .failure(let error):
                    if let response = dataResponse.response, response.statusCode == 201{
                        completion(nil,nil)
                    }else if (error as NSError).code != -999{
                        completion(nil,error)
                    }
                }
        }
    }
}
