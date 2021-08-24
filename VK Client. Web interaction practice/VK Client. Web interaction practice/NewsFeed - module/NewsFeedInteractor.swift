//
//  NewsfFeed.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation
import RealmSwift


protocol NewsFeedInteractorProtocol {
   
    var presenter: NewsFeedPresenterProtocol! {get set}
    var apiWorker: ServiceVKAPIExtendedProtocol {get}
    var realmDBWorker: ServiceDBRealmWritingReading {get}
    
    func getNewsFeedFromServer() -> Void
    func getNewsFromDB(cellIdentifier: String) -> Void
}

class NewsFeedInteractor: NewsFeedInteractorProtocol {

    weak var presenter: NewsFeedPresenterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol = ServiceVKAPIExtended()
    var realmDBWorker: ServiceDBRealmWritingReading = ServiceDBRealm()
    var resultsNewsFromDBRealm: [News]?
    
    init(presenter: NewsFeedPresenterProtocol){
        self.presenter = presenter
    }
    
    
    func getNewsFeedFromServer() -> Void {
        apiWorker.getNewsFeed{[weak self] news in
            guard let self = self else {return}
            
            self.apiWorker.apiQueue.async(flags: .barrier) {
                self.realmDBWorker.writeToDB(elements: news)
            }
        }
    }
    
    
    func getNewsFromDB(cellIdentifier: String) -> Void {
        self.realmDBWorker.readFromDB(cellIdentifierName: cellIdentifier) {[weak self]
            (resultsFromDB: Any...) in
            guard let self = self else {return}
            guard let resultsFromDBNews = resultsFromDB[0] as? Results<News> else {return}
            
            self.resultsNewsFromDBRealm = Array(resultsFromDBNews)
            self.presenter.returnNews(newsFromDB: resultsNewsFromDBRealm)
            
            
            // MARK: Alternative version of reading the news via news source (news owner either a friend or group)
//            guard let resultsFromDBFriends = resultsFromDB[1] as? Results<Friend> else {return}
//            guard let resultsFromDBGroups = resultsFromDB[2] as? Results<Group> else {return}
        }
    }
}
