//
//  String.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
extension String {
    func serverUrlString() -> String {
        
        return "https://image.tmdb.org/t/p/w500"+self
    }
    func inUrl() -> URL {
        
        return URL(string: self)!
    }
}

 
