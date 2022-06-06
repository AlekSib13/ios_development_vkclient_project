//
//  RestApi+NewsFeed.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation

protocol RestAPINewsFeedProtocol {
    func requestFeed(offset: Int, limit: Int, for user: UserAuthData)
}

extension RestAPI: RestAPINewsFeedProtocol {
    func requestFeed(offset: Int, limit: Int, for user: UserAuthData) {
        //here should pass data to retrieve feed
//        makeGetRequest(url: <#T##String#>, method: <#T##HTTPMethod#>, params: <#T##Parameters?#>, for: user)
    }
}
