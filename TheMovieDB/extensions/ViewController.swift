//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import UIKit

fileprivate var activityView: UIView?

extension UIViewController {
    func showSpinner() {
        activityView = UIView(frame: self.view.bounds)
        
        activityView?.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0)
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .red

        activityIndicator.center = activityView!.center
        activityIndicator.startAnimating()
        activityView?.addSubview(activityIndicator)
        self.view.addSubview(activityView!)
    }
    
    func removeSpinner() {
        activityView?.removeFromSuperview()
        activityView = nil
    }
}


