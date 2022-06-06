//
//  FriendsListInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation
import RealmSwift

protocol FriendsListInteractorProtocol {
}


class FriendsListInteractor: FriendsListInteractorProtocol {
    
    weak var presenter: FriendsListPresenterProtocol?
    let manager: FriendsListManagerProtocol
    let user: UserAuthData
    
    init(manager: FriendsListManagerProtocol, user: UserAuthData) {
        self.manager = manager
        self.user = user
    }
}
    

