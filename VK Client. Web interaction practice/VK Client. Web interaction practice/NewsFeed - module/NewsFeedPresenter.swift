//
//  NewsFeedPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//



import Foundation
import UIKit

protocol NewsFeedPresenterProtocol: AnyObject, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
    var view: NewsFeedViewControllerProtocol! {get set}
    var interactor: NewsFeedInteractorProtocol! {get set}
    var router: NewsFeedRouterProtocol! {get set}
    
//    func registerCell(into tableView: UITableView) -> Void
    
    func fetchNews() -> Void
}


class NewsFeedPresenter: NSObject, NewsFeedPresenterProtocol {
  
    weak var view: NewsFeedViewControllerProtocol!
    var interactor: NewsFeedInteractorProtocol!
    var router: NewsFeedRouterProtocol!
    
    init(view: NewsFeedViewControllerProtocol){
        self.view = view
    }
        
    
    //MARK: Work with newsFeedTableView
    
    let newsFeedNewsOwnerCellIdentifier = "newsFeedNewsOwnerCellIdentifier"
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return interactor.numberOfNews
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contentParamsNum = interactor.returnNewsPostContentParamsNum(elementNum: section) else {return 0}
        print ("this is content params num: \(contentParamsNum)")
        return contentParamsNum
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        let pageSize = tableView.visibleCells.count
        let totalSize = interactor.numberOfNews
        guard let last = indexPaths.first, (totalSize - last.row) < pageSize else {return}
        
        interactor.getNewsFromDB(cellIdentifier: newsFeedNewsOwnerCellIdentifier)
    }
    
    func registerCell(into tableView: UITableView) {
        tableView.register(NewsFeedOwnerCell.self, forCellReuseIdentifier: newsFeedNewsOwnerCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "new post"
    }
    
    
    //-------------
    
    
    func fetchNews() -> Void {
        interactor.getNewsFeedFromServer(cellIdentifier: newsFeedNewsOwnerCellIdentifier)
        interactor.getNewsFromDB(cellIdentifier: newsFeedNewsOwnerCellIdentifier)
    }
}
