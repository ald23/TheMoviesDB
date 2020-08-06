//
//  MoviesDetailViewController.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import UIKit

class MoviesDetailViewController: ScrollViewController {
    
    var movies: MoviesModel
    
    lazy var posterImageView = UIImageView()
    lazy var voteLabel = UILabel()
    lazy var titleLabel = UILabel()
    lazy var releaseLabel = UILabel()
    lazy var overviewLabel = UILabel()
    
    init(movies: MoviesModel) {
        self.movies = movies
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupData()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        var title = UILabel()
        title = titleLabel
        titleLabel.sizeToFit()
        self.navigationItem.titleView = title
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupData() -> Void {
        if let poster = movies.poster {
            posterImageView.kf.setImage(with: poster.serverUrlString().inUrl())
        }
        titleLabel.text = movies.title
        releaseLabel.text = movies.release
        voteLabel.text = "\(movies.vote ?? 0.0)"
        overviewLabel.text = movies.overview
    }

}

extension MoviesDetailViewController: ViewInstallation {
    func addSubviews() {
        contentView.addSubview(posterImageView)
        posterImageView.addSubview(releaseLabel)
        posterImageView.addSubview(titleLabel)
        posterImageView.addSubview(voteLabel)
        contentView.addSubview(overviewLabel)
    }
    
    func addConstraints() {
        posterImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
//            make.top.equalTo(AppConstants.navBarHeight)
            make.height.equalTo(AppConstants.screenWidth)
        }
        

        voteLabel.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.top.equalTo(24)
            make.height.width.equalTo(50)
        }
        
        releaseLabel.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.top.equalTo(134)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.bottom.equalTo(releaseLabel.snp.top).offset(-16)
        }

        overviewLabel.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(posterImageView.snp.bottom).offset(16)
            make.bottom.lessThanOrEqualTo(-16)
        }
    }
    
    func stylizeViews() {
        view.backgroundColor = .white
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.masksToBounds = true

        voteLabel.backgroundColor = .white
        voteLabel.font = .boldSystemFont(ofSize: 28)
        voteLabel.textAlignment = .center
        voteLabel.layer.cornerRadius = 7
        voteLabel.layer.masksToBounds = true

        titleLabel.backgroundColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        
        releaseLabel.backgroundColor = .white
        releaseLabel.font = .boldSystemFont(ofSize: 28)
        releaseLabel.textAlignment = .left

        overviewLabel.textColor = .black
        overviewLabel.numberOfLines = 0
        overviewLabel.font = .systemFont(ofSize: 17)
        overviewLabel.textAlignment = .left


    }
    
    
}
