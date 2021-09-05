//
//  SaverReaderDbService.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 08.07.2021.
//

import Foundation
import RealmSwift


protocol ServiceDBRealmWritingReading {
    var realmConfig: Realm.Configuration {get}
    
    func writeToDB(elements: [AnyObject]) -> Void
    func readFromDB(cellIdentifierName: String, completion: (Any...) -> Void) -> Void
    
    func readLastElementFromDB(cellIdentifierName: String, completion: (Any?) -> Void)
    
    func temporaryFuncWriteToDB(userAuthData: User) -> Void
}


class ServiceDBRealm: ServiceDBRealmWritingReading {
    let realmConfig = Realm.Configuration(schemaVersion: Singleton.shared.realmSchemaNum)
    
    enum DBWriteReadError: String, Error {
        case CouldNotWriteToDB = "The attempt to commit inssertion to RealmDB has failed"
        case CouldNotReadFromdb = "The attempt to read from RealmDB has failed"
    }
    
    func writeToDB(elements: [AnyObject]) {
        let realm = try! Realm(configuration: realmConfig)
        print(realm.configuration.fileURL)
        
        realm.beginWrite()
        
        for element in elements {
            if let friend  = element as? Friend {
                realm.add(friend, update: .modified)
            } else if let group = element as? Group {
                realm.add(group, update: .modified)
            } else if let news = element as? News {
                realm.add(news, update: .modified)
                
                if let friend = realm.object(ofType: Friend.self, forPrimaryKey: news.sourceId) {
                    friend.news.append(news)
                } else if let group = realm.object(ofType: Group.self, forPrimaryKey: news.sourceId) {group.news.append(news)
                }
            }
            else {continue}
        }
        do {
            try realm.commitWrite()} catch {DBWriteReadError.CouldNotWriteToDB.rawValue}
    }
    
    
    func readFromDB (cellIdentifierName: String, completion: (Any...) -> Void) -> Void {
        let realm = try! Realm(configuration: realmConfig)
        if cellIdentifierName == "friendsListTableViewCellIdentifier" {
            let results = realm.objects(Friend.self)
            completion(results)
        } else if cellIdentifierName == "groupsListTableViewCellIdentifier"{
            let results = realm.objects(Group.self)
            completion(results)
        } else if cellIdentifierName == "newsFeedNewsOwnerCellIdentifier" {
            
            let resultsNews = realm.objects(News.self).sorted(byKeyPath: "newsDateTime", ascending: false).filter("newsText != nil || photos.@count > 0")
            
            let resultsFriends = realm.objects(Friend.self).filter("news.@count > 0")
            let resultsGroups = realm.objects(Group.self).filter("news.@count > 0")
            
            
            completion(resultsNews, resultsFriends, resultsGroups)
            
            // MARK: Alternative version of reading the news via news source (news owner either a friend or group)
//            let resultsFriendsNews = realm.objects(Friend.self).filter("news.@count > 0")
//            let resultsGroupsNews = realm.objects(Group.self).filter("news.@count > 0")
            
//            var resultsNews = [Any]()
//            for friend in resultsFriendsNews {
//                resultsNews.append(friend)
//            }
//            for group in resultsGroupsNews {
//                resultsNews.append(group)
//            }
        }
        else {return}
    }
    
    
    func temporaryFuncWriteToDB(userAuthData: User) {
        let realm = try! Realm(configuration: realmConfig)
        print(realm.configuration.fileURL)
        realm.beginWrite()
        realm.add(userAuthData, update: .modified)
        do {
            try realm.commitWrite()} catch {DBWriteReadError.CouldNotWriteToDB.rawValue}
    }
}

extension ServiceDBRealm {
    func readLastElementFromDB(cellIdentifierName: String, completion: (Any?) -> Void) {
        let realm = try! Realm(configuration: realmConfig)
        let sortedNews = realm.objects(News.self).sorted(byKeyPath: "newsDateTimeUnix", ascending: false)
        let thelatestNews: News? = sortedNews[0]
        completion(thelatestNews)
    }
}

