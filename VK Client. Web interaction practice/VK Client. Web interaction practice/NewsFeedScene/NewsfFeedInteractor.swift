//
//  NewsfFeed.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation


protocol NewsFeedInteractorProtocol {
   
    var presenter: NewsFeedPresenterProtocol! {get set}
    var apiWorker: ServiceVKAPIExtendedProtocol! {get set}
    var realmDBWorker: ServiceDBRealmWritingReading! {get set}
}

class NewsFeedInteractor: NewsFeedInteractorProtocol {

    var presenter: NewsFeedPresenterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol!
    var realmDBWorker: ServiceDBRealmWritingReading!
    
    init(){}
    
    
}
