//
//  NewsFeedManager.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation

protocol NewsFeedManagerProtocol {
    //Here will be net request
//    func getInitialFeed(offset: Int, limit: Int, for user: UserAuthData)
}

class NewsFeedManager: NewsFeedManagerProtocol {
  
    let rest: RestAPINewsFeedProtocol
    let dbManager: NewsFeedDBManagerProtocol
    
    init(rest: RestAPINewsFeedProtocol, dbManager: NewsFeedDBManagerProtocol) {
        self.rest = rest
        self.dbManager = dbManager
    }
    
//    func getInitialFeed(offset: Int, limit: Int, for user: UserAuthData) {
//        rest.requestFeed(offset: offset, limit: limit, for: user)
//    }
}
