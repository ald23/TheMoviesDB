//
//  MoviesModel.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation

class MoviesModel {
    var id: Int?
    var poster: String?
    var title: String?
    var release: String?
    var vote: Float?
    var overview: String?
    
    init?(dictList: [String: Any]) {
        self.id = dictList["id"] as? Int
        self.poster = dictList["poster_path"] as? String
        self.title = dictList["title"] as? String
        self.release = dictList["release_date"] as? String
        self.vote = dictList["vote_average"] as? Float
        self.overview = dictList["overview"] as? String
    }
}
