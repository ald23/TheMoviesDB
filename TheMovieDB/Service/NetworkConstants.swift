//
//  NetworkConstants.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation

struct NetworkConstants {
    static let defaultRequestParams = ["api_key": "48ccac1734a22c8228beb1dbf6fe3bed"]
    static let defaultRequestHeaders = ["Content-type": "application/json; charset=utf-8"]
    static let baseURL = "https://api.themoviedb.org/3"
    static let nowPlayingServicePath = "/movie/now_playing"
    static let searchServicePath = "/search/movie"
    static let imagesBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let queryParameterKey = "query"
    static let pageParameterKey = "page"
}

