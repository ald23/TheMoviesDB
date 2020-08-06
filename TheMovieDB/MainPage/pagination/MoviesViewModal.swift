//
//  MoviesViewModal.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import PromiseKit

class MoviesViewModal {
    var moviesList = [MoviesModel]()
    var page = 1
    var total = 10
    
    func getList() -> Promise<Void> {
        return Promise { [weak self] seal in
            MoviesApi.getList(page: page).done { (moviesList) in
                    self?.moviesList = []
                    self?.moviesList = moviesList
                    seal.fulfill(())
                }.catch { (e) in
                    seal.reject(e)
            }
        }
    }
    
    func getListByParams() -> Promise<Bool> {
        return Promise { [weak self] seal in
            if (page <= total) {
                MoviesApi.getList(page: page + 1).done { (moviesList) in
                        self?.page += 1
                        for item in moviesList {
                            self?.moviesList.append(item)
                        }
                        seal.fulfill(true)
                    }.catch { (e) in
                        seal.reject(e)
                }
            } else {
                seal.fulfill(false)
            }
        }
    }
}
