//
//  ViewInstallation.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation

protocol ViewInstallation {
    func addSubviews()
    func addConstraints()
    func stylizeViews()
}

extension ViewInstallation {
    func setupViews() {
        addSubviews()
        addConstraints()
        stylizeViews()
    }
}

