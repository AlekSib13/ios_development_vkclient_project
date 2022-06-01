//
//  RealmDBService.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.05.2022.
//

import Foundation
import RealmSwift

protocol BaseRealm {}

extension BaseRealm {
    var realmDB: Realm {try! Realm()}
}


class RealmDBManager {
    static let instance = RealmDBManager()
    
    private init() {}
    
    func initializeDB() {
        
        let file = try? FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("vkClient.realm")
        
        guard let file = file else {
            return
        }
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(fileURL: file, inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: 0, migrationBlock: nil, deleteRealmIfMigrationNeeded: true, shouldCompactOnLaunch: nil, objectTypes: nil)
        
        print("Realm: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
}


class RealmDBManagerService: BaseRealm {
    static let instance = RealmDBManagerService()
    
    private init(){}
}
