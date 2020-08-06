//
//  ScrollViewController.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController {
    
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
    
    func setupScrollView() {
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.keyboardDismissMode = .onDrag
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(AppConstants.screenHeight - AppConstants.statusBarHeight)
            make.top.equalTo(AppConstants.statusBarHeight)
            make.width.equalTo(AppConstants.screenWidth)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.width.edges.equalToSuperview()
            //            make.width.equalTo(view)
        }
    }
    
    //MARK: - Simple functions
    func addToScrollView(_ views: [UIView]) -> Void {
        for view in views {
            scrollView.addSubview(view)
        }
    }
}
