//
//  NetworkAPI.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class NetworkApi {
    
    private init() {}
    
    static func api(rest: Rest, method: HTTPMethod, params: [String: Any]) -> Promise<Any> {
        return Promise { seal in
            let serverParams: [String: Any] = ["Content-Type": "application/json; charset=utf-8"]
            let params = serverParams.merging(params, uniquingKeysWith: { (first, _) in first })
            AF.request("\(rest.rest())?api_key=48ccac1734a22c8228beb1dbf6fe3bed",
                    method: method,
                    parameters: params).validate()
                .responseJSON(completionHandler: {
                    (response) in
                    switch response.result {
                    case .success(let success):
                        seal.fulfill(success)
                    case .failure(let e):
                        seal.reject(e)
                    }
                })
        }
    }

}
