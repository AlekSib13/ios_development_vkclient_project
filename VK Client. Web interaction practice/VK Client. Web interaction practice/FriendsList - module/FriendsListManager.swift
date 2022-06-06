//
//  FriendsListManager.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation

protocol FriendsListManagerProtocol {}


class FriendsListManager: FriendsListManagerProtocol {
    let rest: RestAPIFriendListProtocol
    
    init(rest: RestAPIFriendListProtocol) {
        self.rest = rest
    }
    
}
