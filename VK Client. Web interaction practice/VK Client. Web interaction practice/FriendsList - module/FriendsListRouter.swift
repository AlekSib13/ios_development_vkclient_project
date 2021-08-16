//
//  FriendsListRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation

protocol FriendsListRouterProtocol {
    var view: FriendsListViewControllerProtocol! {get}
}

class FriendsListRouter: FriendsListRouterProtocol {
    weak var view: FriendsListViewControllerProtocol!
    
    init(view: FriendsListViewControllerProtocol){
        self.view = view
    }
}
