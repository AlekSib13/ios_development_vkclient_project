//
//  NewsFeedTapeInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation


protocol NewsFeedTapeInteractorProtocol {
}


class NewsFeedTapeInteractor: NewsFeedTapeInteractorProtocol {
    
    weak var presenter: NewsFeedTapePresenterProtocol?
    let manager: NewsFeedManagerProtocol?
    let user: UserAuthData
    
    init(manager: NewsFeedManagerProtocol, for user: UserAuthData) {
        self.manager = manager
        self.user = user
//        getFeed()
    }
    
    //Work in progress
//    func getFeed(offset: Int? = nil, limit: Int? = nil) {
//        var offsetAdj = offset, limitAdj = limit
//        if offsetAdj == nil, limitAdj == nil {
//            offsetAdj = 0; limitAdj = 20
//        }
//        manager?.getInitialFeed(offset: offsetAdj, limit: limitAdj, for: user)
//    }
    
}
