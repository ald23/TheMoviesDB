//
//  MoviesController.swift
//  TheMovieDB
//
//  Created by Aldiyar Massimkhanov on 8/4/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import UIKit

class MoviesController: UIViewController {
    var tableView = UITableView()
    
    private var viewModel = MoviesViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupViews()
        tableView.refreshControl?.tintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.tableView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc private func loadData() {
        viewModel.getList().done { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.refreshControl?.endRefreshing()
            }.catch { (e) in
                print("Error => ", e.localizedDescription)
        }
    }
}

extension MoviesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.cellIdentifier(), for: indexPath) as! MoviesTableViewCell
        
        cell.configuration(model: viewModel.moviesList[indexPath.row])
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    // pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear

        if indexPath.row == self.viewModel.moviesList.count - 3 {
            self.viewModel.getListByParams().done({ (result) in
                if result {
                    tableView.reloadData()
                }
            }).catch { (e) in
                print(e.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MoviesDetailViewController(movies: viewModel.moviesList[indexPath.row])
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MoviesController: ViewInstallation {
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func addConstraints(){
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(AppConstants.navBarHeight + 32)
        }
    }
    
    func stylizeViews() {
        navigationItem.title = "News"
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.cellIdentifier())
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.backgroundColor = UIColor(ciColor: .clear)
        tableView.refreshControl?.tintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        tableView.refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
}


