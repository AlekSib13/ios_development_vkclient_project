//
//  NewsFeedPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation

protocol NewsFeedPresenterProtocol: AnyObject {
    var view: NewsFeedViewControllerProtocol! {get set}
    var interactor: NewsFeedInteractorProtocol! {get set}
    var router: NewsFeedRouterProtocol! {get set}
    
    func fetchNews() -> Void
    func getNewsFromDB(cellIdentifier: String) -> Void
    func returnNews(newsFromDB: [News]?) -> Void
//    func returnNews(newsFromDB: [Any]?) -> Void
    
    
    func returnNumberOfRowsPerSection(newsFromDB: [News], section: Int) -> Int
}

class NewsFeedPresenter: NewsFeedPresenterProtocol {
    
    
    
    weak var view: NewsFeedViewControllerProtocol!
    var interactor: NewsFeedInteractorProtocol!
    var router: NewsFeedRouterProtocol!
    
    init(view: NewsFeedViewControllerProtocol){
        self.view = view
    }
    
    func fetchNews() -> Void {
        interactor.getNewsFeedFromServer()
    }
    
    func getNewsFromDB(cellIdentifier: String) -> Void {
        interactor.getNewsFromDB(cellIdentifier: cellIdentifier)
    }
    
    func returnNews(newsFromDB: [News]?) {
        view.returnNews(newsFromDB: newsFromDB)
    }
        
    
    func returnNumberOfRowsPerSection(newsFromDB: [News], section: Int) -> Int {
        if newsFromDB[section].newsText != nil && newsFromDB[section].photos.count != 0 {
            let numberOfRowsPerSection = 4
            return numberOfRowsPerSection
        }
        else {return 3}
    }
    
    
    // MARK: Alternative version of reading the news via news source (news owner either a friend or group)
    //    func returnNews(newsFromDB: [Any]?) {
    //        view.returnNews(newsFromDB: newsFromDB)
    //    }
}
