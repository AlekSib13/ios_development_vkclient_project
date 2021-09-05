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
    var numberOfNews: Int {get}
    
//    func getNewsFeedFromServer() -> Void
    func getNewsFeedFromServer(cellIdentifier: String) -> Void
    func getNewsFromDB(cellIdentifier: String) -> Void
    func returnNewsPostContentParamsNum(elementNum: Int) -> Int?
}

class NewsFeedInteractor: NewsFeedInteractorProtocol {

    weak var presenter: NewsFeedPresenterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol = ServiceVKAPIExtended()
    var realmDBWorker: ServiceDBRealmWritingReading = ServiceDBRealm()
    private var resultsNewsFromDBRealm: [News]?
    private var resultsFriendsFromDBRealm: [Friend]?
    private var resultsGroupsFromDBRealm: [Group]?
    
    init(presenter: NewsFeedPresenterProtocol){
        self.presenter = presenter
    }
    
    var numberOfNews: Int {
        guard let resultsNewsFromDBRealm = resultsNewsFromDBRealm?.count else {return 0}
        return resultsNewsFromDBRealm
    }
    
    
    func getNewsFeedFromServer(cellIdentifier: String) {
        var theUnixDateTimeOFtheLatestItem: Int? = nil
        self.realmDBWorker.readLastElementFromDB(cellIdentifierName: cellIdentifier){result in
            guard let theLatestNews = result as? News else {return}
            theUnixDateTimeOFtheLatestItem = theLatestNews.newsDateTimeUnix
        }
        
        apiWorker.getNewsFeed(fetchedFromDateTime: theUnixDateTimeOFtheLatestItem){[weak self] news in
            guard let self = self else {return}
            self.apiWorker.apiQueue.async(flags: .barrier) {
                self.realmDBWorker.writeToDB(elements: news)
            }
        }
    }
    
    
    
    func getNewsFromDB(cellIdentifier: String) -> Void {
        
        //MARK: Future changes: make data extraction from db asynchronios. + the whole content of the db should not be extracted, only limited number (for inst. 20 of objects is extracted by evere request
        self.realmDBWorker.readFromDB(cellIdentifierName: cellIdentifier) {[weak self]
            (resultsFromDB: Any...) in
            guard let self = self else {return}
            guard let resultsFromDBNews = resultsFromDB[0] as? Results<News>, let resultsFromDBFriends = resultsFromDB[1]  as? Results<Friend>, let resultsFromDBGroups = resultsFromDB[2] as? Results<Group> else {return}
            
            self.resultsNewsFromDBRealm = Array(resultsFromDBNews)
            self.resultsFriendsFromDBRealm = Array(resultsFromDBFriends)
            self.resultsGroupsFromDBRealm = Array(resultsFromDBGroups)
        }
    }
    
    func returnNewsPostContentParamsNum(elementNum: Int) -> Int? {
        guard let resultsNewsFromDBRealm = resultsNewsFromDBRealm else {return nil}
        let theNews = resultsNewsFromDBRealm[elementNum]
        if theNews.photos.count != 0 && theNews.newsText != nil {
            return 4
        } else {return 3}
    }
}
