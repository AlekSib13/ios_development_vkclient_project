//
//  NewsFeedViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit
import SnapKit


protocol NewsFeedViewControllerProtocol: AnyObject {
    
    var newsFeedTableView: UITableView {get}
    var configurator: NewsFeedConfiguratorProtocol {get}
    var presenter: NewsFeedPresenterProtocol! {get}
    
}


final class NewsFeedViewController: UIViewController {
    
    
    let configurator: NewsFeedConfiguratorProtocol = NewsFeedConfigurator()
    var presenter: NewsFeedPresenterProtocol!
    
    let newsFeedTableView = UITableView()
    
    let NewsFeedNewsOwnerCellIdentifier = "newsFeedNewsOwnerCellIdentifier"
    
    var resultNewsFromDB: [News]?
    
//    private lazy var refreshControl: UIRefreshControl = {
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
//        return refreshControl
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        assemblyUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchNews()
    }
    
    
    private func assemblyUI() {
        view.addSubview(newsFeedTableView)
        newsFeedTableView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func configureTableView() {
        newsFeedTableView.dataSource = presenter
        newsFeedTableView.delegate = presenter
        newsFeedTableView.prefetchDataSource = presenter
//        newsFeedTableView.refreshControl = refreshControl
//        presenter.registerCell(into: newsFeedTableView)
    }
    
    
}



extension NewsFeedViewController: NewsFeedViewControllerProtocol {

    @objc private func pullToRefresh() {
        //MARK: here will be code
    }
}


