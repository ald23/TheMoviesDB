//
//  NetworkConfig.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation

enum Session {
    case ADMIN
    case USER
    case None
    
    public func token() -> String {
        switch self {
        case .ADMIN:
            return UserDefaults.standard.string(forKey: "adminToken") ?? ""
        case .USER:
            return UserDefaults.standard.string(forKey: "userToken") ?? ""
        case .None:
            return ""
        }
    }
}

enum Rest {
    case GETLIST
    
    public func rest() -> String {
        let service = "https://api.themoviedb.org/3"
        switch self {
        case .GETLIST:
            return service + "/movie/now_playing"
        }
    }
}
