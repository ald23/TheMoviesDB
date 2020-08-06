//
//  AppError.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation

enum AppError: Error {
    case failInternetError
    case defError
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failInternetError:
            return NSLocalizedString("Please, check internet connection.", comment: "")
        case .defError:
            return NSLocalizedString("Please try it after few time.", comment: "")
        }
    }
}
