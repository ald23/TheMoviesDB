//
//  MoviesAPI.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class MoviesApi {
    
    private init() {}
    
    static func getList(page: Int) -> Promise<[MoviesModel]> {
        return Promise { seal in
            let params: [String: Any] = ["page": page]
            NetworkApi.api(rest: .GETLIST, method: .get, params: params).done({ (response) in
                guard let responseModel = response as? [String: Any] else { throw AppError.defError }
                guard let resultList = responseModel["results"] as? [[String: Any]] else { throw AppError.defError }
                var modelList = [MoviesModel]()
                for item in resultList {
                    guard let model = MoviesModel(dictList: item) else { continue }
                    modelList.append(model)
                }
                seal.fulfill(modelList)
            }).catch({ (e) in
                seal.reject(e)
            })
        }
    }
}
