//
//  TableViewCell.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/6/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
