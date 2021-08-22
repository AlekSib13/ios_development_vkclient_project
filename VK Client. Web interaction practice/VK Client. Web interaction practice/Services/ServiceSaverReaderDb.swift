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
//    var realm: Realm {get}
    
    func writeToDB(elements: [AnyObject]) -> Void
    func readFromDB (cellIdentifierName: String, completion: (Any) -> Void) -> Void
    
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
                print(news)
                realm.add(news, update: .modified)
            }
            else {continue}
        }
        do {
            try realm.commitWrite()} catch {DBWriteReadError.CouldNotWriteToDB.rawValue}
    }
    
    
    func readFromDB (cellIdentifierName: String, completion: (Any) -> Void) -> Void {
        let realm = try! Realm(configuration: realmConfig)
        if cellIdentifierName == "friendsListTableViewCellIdentifier" {
            let results = realm.objects(Friend.self)
            completion(results)
        } else if cellIdentifierName == "groupsListTableViewCellIdentifier"{
            let results = realm.objects(Group.self)
            completion(results)
        } else {return}
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


