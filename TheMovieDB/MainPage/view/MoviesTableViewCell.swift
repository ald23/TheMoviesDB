//
//  MoviesTableCell.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class MoviesTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var posterView = UIImageView()
    var voteLabel = UILabel()
    var releaseLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configuration(model: MoviesModel) -> Void {
        titleLabel.text = model.title
        voteLabel.text = String(describing: model.vote ?? 0.0)
        releaseLabel.text = model.release
        if let poster = model.poster {
            posterView.kf.setImage(with: poster.serverUrlString().inUrl())
        }
    }
}

extension MoviesTableViewCell: ViewInstallation {
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(posterView)
        addSubview(releaseLabel)
        addSubview(voteLabel)
        
    }
    
    func addConstraints() {
        
        posterView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
            make.left.equalTo(16)
        }
        
        
        
        releaseLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(posterView.snp.right).offset(16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(posterView.snp.right).offset(16)
            make.right.equalTo(8)
            make.bottom.equalTo(releaseLabel.snp.top).offset(-4)
        }
        
        voteLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(releaseLabel.snp.bottom).offset(4)
        }
        
    }
    
    func stylizeViews() {
        posterView.layer.cornerRadius = 10
        posterView.layer.masksToBounds = true
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        releaseLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        releaseLabel.font = UIFont.systemFont(ofSize: 18.0)
        
        voteLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        voteLabel.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    
}
