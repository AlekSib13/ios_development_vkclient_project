//
//  NewsfFeed.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation


protocol NewsFeedInteractorProtocol {
   
    var presenter: NewsFeedPresenterProtocol! {get set}
    var apiWorker: ServiceVKAPIExtendedProtocol {get}
    var realmDBWorker: ServiceDBRealmWritingReading {get}
    
    func getNewsFeedFromServer() -> Void
}

class NewsFeedInteractor: NewsFeedInteractorProtocol {

    weak var presenter: NewsFeedPresenterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol = ServiceVKAPIExtended()
    var realmDBWorker: ServiceDBRealmWritingReading = ServiceDBRealm()
    
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
    
}
