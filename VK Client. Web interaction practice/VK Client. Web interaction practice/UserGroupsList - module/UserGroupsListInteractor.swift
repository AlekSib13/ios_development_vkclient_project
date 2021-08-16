//
//  UserGroupsListInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 16.08.2021.
//

import Foundation
import RealmSwift


protocol UserGroupsListInteractorProtocol {
    var presenter: UserGroupsListPresenterProtocol! {get}
    var apiWorker: ServiceVKAPIExtendedProtocol {get}
    var realmDBWorker: ServiceDBRealmWritingReading {get}
    var resultsFromDBRealm: [Group]? {get}
    var imageLoaderWorker: ImageLoaderProtocol {get}
    
    func getUserGroupsListFromServer() -> Void
    func getUserGroupsListFromDB(cellIdentifier: String) -> Void
}

class UserGroupsListInteractor: UserGroupsListInteractorProtocol {

    weak var presenter: UserGroupsListPresenterProtocol!
    
    var apiWorker: ServiceVKAPIExtendedProtocol = ServiceVKAPIExtended()
    var realmDBWorker: ServiceDBRealmWritingReading = ServiceDBRealm()
    var resultsFromDBRealm: [Group]?
    var imageLoaderWorker: ImageLoaderProtocol = ImageLoader()
    
    init(presenter: UserGroupsListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getUserGroupsListFromServer() -> Void {
        apiWorker.getUserGroups{[weak self] groups in
            guard let self = self else {return}
            
            self.apiWorker.apiQueue.async(flags: .barrier) {
                self.realmDBWorker.writeToDB(elements: groups)
            }
        }
    }
    
    
    func getUserGroupsListFromDB(cellIdentifier: String) -> Void {
        self.realmDBWorker.readFromDB(cellIdentifierName: cellIdentifier){[weak self]
            resultsFromDB in
            guard let self = self else {return}
            guard let resultsFromDB = resultsFromDB as? Results<Group> else {return}
            
            let resultsFromDBThreadSafeRef = ThreadSafeReference(to: resultsFromDB)
            
            self.resultsFromDBRealm = Array(resultsFromDB)
            self.presenter.returnUserGroupsList(userGroupsListFromDB: self.resultsFromDBRealm)
            
            DispatchQueue.global().async {
                let realmConfig = Realm.Configuration(schemaVersion: 5)
                let realm = try! Realm(configuration: realmConfig)
                guard let userGroupsListExisting = realm.resolve(resultsFromDBThreadSafeRef) else {return}
                
                var userGroupsAvatarLinksList = [String]()
                for group in userGroupsListExisting {
                    let avatarlink = group.groupAvatar ?? "-"
                    userGroupsAvatarLinksList.append(avatarlink)
                }
                self.imageLoaderWorker.downloadImage(imageLinks: userGroupsAvatarLinksList){
                    listofImages in
                    DispatchQueue.main.async {
                        self.presenter.returnLoadedImage(listOfImages: listofImages)
                    }
                }
            }
        }
    }
    
}
