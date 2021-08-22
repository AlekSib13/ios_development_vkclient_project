//
//  Manager.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 22.07.2021.
//

import Foundation
import RealmSwift

//protocol WorkManagerable {
//    var serviceConnectionAPI: ServiceVKAPIExtendedProtocol! {get}
//    var serviceConnectionRealmDB: ServiceDBRealmWritingReading! {get}
//    
//    func downloadDataViaAPI() -> Void
//    func retrieveDataFromDB(cellIdentifier: String) -> Any?
//    func downloadImage(imageLink: String?) -> UIImage?
//}
//
//class ManagerSingleton: WorkManagerable {
//    
//    
//    static var shared = ManagerSingleton()
//    internal var serviceConnectionAPI: ServiceVKAPIExtendedProtocol!
//    internal var serviceConnectionRealmDB: ServiceDBRealmWritingReading!
//   
//    
//    private init(){}
//    
//    func downloadDataViaAPI() {
//        serviceConnectionAPI = ServiceVKAPIExtended()
//        serviceConnectionRealmDB = ServiceDBRealm()
//        
//        serviceConnectionAPI.getUserFriends{[weak self] in
//            guard let self = self else {return}
//            self.serviceConnectionRealmDB.writeToDB(elements: $0)
//        }
//        
//        serviceConnectionAPI.getUserGroups{[weak self] in
//            guard let self = self else {return}
//            self.serviceConnectionRealmDB.writeToDB(elements: $0)
//        }
//        
//    }
//    
////    func retrieveDataFromDB(cellIdentifier: String) -> Any? {
////        serviceConnectionRealmDB = ServiceDBRealm()
////        let resultsFromDB = serviceConnectionRealmDB.readFromDB(cellIdentifierName: cellIdentifier)
////        return resultsFromDB
////    }
//    
//    func downloadImage(imageLink: String?) -> UIImage? {
//        guard let imageLink = imageLink else {return nil}
//        let imageUrl = URL(string: imageLink)
//        guard let imageData = try? Data(contentsOf: imageUrl!), let image = UIImage(data: imageData) else {return nil}
//        return image
//    }
//}
