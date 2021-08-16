//
//  FriendsListInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation
import RealmSwift

protocol FriendsListInteractorProtocol {
    var presenter: FriendsListPresenterProtocol! {get}
    var apiWorker: ServiceVKAPIExtendedProtocol {get}
    var realmDBWorker: ServiceDBRealmWritingReading {get}
    var resultsFromDBRealm: [Friend]? {get}
    var imageLoaderWorker: ImageLoaderProtocol {get}
    
    func getFriendsListFromServer() -> Void
    func getFriendsListFromDB(cellIdentifier: String) -> Void
}


class FriendsListInteractor: FriendsListInteractorProtocol {
    weak var presenter: FriendsListPresenterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol = ServiceVKAPIExtended()
    var realmDBWorker: ServiceDBRealmWritingReading = ServiceDBRealm()
    var imageLoaderWorker: ImageLoaderProtocol = ImageLoader()
    var resultsFromDBRealm: [Friend]?
    
    
    init(presenter: FriendsListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getFriendsListFromServer() -> Void {
        apiWorker.getUserFriends{[weak self] friends in
            guard let self = self else {return}
            
            self.apiWorker.apiQueue.async(flags: .barrier) {
                self.realmDBWorker.writeToDB(elements: friends)
            }
        }
    }
    
    func getFriendsListFromDB(cellIdentifier: String) -> Void {
        self.realmDBWorker.readFromDB(cellIdentifierName: cellIdentifier){[weak self]
            resultsFromDB in
            guard let self = self else {return}
            guard let resultsFromDB = resultsFromDB as? Results<Friend> else {return}
            
            let resultsFromDBThreadSafeRef = ThreadSafeReference(to: resultsFromDB)
            
            self.resultsFromDBRealm = Array(resultsFromDB)
            self.presenter.returnFriendsList(friendsListFromDB: self.resultsFromDBRealm)
            
            DispatchQueue.global().async {
                let realmConfig = Realm.Configuration(schemaVersion: 5)
                let realm = try! Realm(configuration: realmConfig)
                guard let friendsListExisting = realm.resolve(resultsFromDBThreadSafeRef) else {return}
                
                var friendsAvatarLinksList = [String]()
                for friend in friendsListExisting{
                    let avatarlink = friend.avatar ?? "-"
                    friendsAvatarLinksList.append(avatarlink)
                }
                self.imageLoaderWorker.downloadImage(imageLinks: friendsAvatarLinksList){
                    listofImages in
                    DispatchQueue.main.async {
                        self.presenter.returnLoadedImage(listOfImages: listofImages)
                    }
                }
            }
        }
    }
}
    
    
//    func loadImageViaLink(imageLink: String) -> Void {
//        DispatchQueue.global(qos: .utility).async {
//            let downloadedImage = self.imageLoaderWorker.downloadImage(imageLink: imageLink)
//            if let image = downloadedImage {
//                DispatchQueue.main.async {
//                    self.presenter.returnLoadedImage(image: image)
//                }
//            } else {let imageOptional = UIImage(named: "no_img")
//                guard let image = imageOptional else {return}
//                DispatchQueue.main.async {
//                    self.presenter.returnLoadedImage(image: image)
//                }
//            }
//        }
//    }
    

