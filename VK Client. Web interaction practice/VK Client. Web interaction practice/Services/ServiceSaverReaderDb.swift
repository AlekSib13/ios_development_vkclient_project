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
    var realm: Realm {get}
    
    func writeToDB(elements: [AnyObject]) -> Void
    func readFromDB(cellIdentifierName: String) -> Any?

}


class ServiceDBRealm: ServiceDBRealmWritingReading {

    let realmConfig = Realm.Configuration(schemaVersion: 4)
    lazy var realm = try! Realm(configuration: realmConfig)
    
    enum DBWriteReadError: String, Error {
        case CouldNotWriteToDB = "The attempt to commit inssertion to RealmDB has failed"
        case CouldNotReadFromdb = "The attempt to read from RealmDB has failed"
    }
    
    func writeToDB(elements: [AnyObject]) {
        print(realm.configuration.fileURL)
        realm.beginWrite()
        
        for element in elements {
            if let friend  = element as? Friend {
                realm.add(friend, update: .modified)
            } else if let group = element as? Group{
                realm.add(group, update: .modified)
            } else {continue}
        }
        do {
            try realm.commitWrite()} catch {DBWriteReadError.CouldNotWriteToDB.rawValue}
    }
    
    
    func readFromDB (cellIdentifierName: String) -> Any? {
        if cellIdentifierName == "friendsListTableViewCellIdentifier" {
            let results = realm.objects(Friend.self)
            return results
        } else if cellIdentifierName == "groupsListTableViewCellIdentifier"{
            let results = realm.objects(Group.self)
            return results
        } else {return nil}
    }
}


