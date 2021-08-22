//
//  UserGroupsListRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 16.08.2021.
//

import Foundation


protocol UserGroupsListRouterProtocol {
    var view: UserGroupsListViewControllerProtocol! {get}
}

class UserGroupsListRouter: UserGroupsListRouterProtocol {
    weak var view: UserGroupsListViewControllerProtocol!
    
    init(view: UserGroupsListViewControllerProtocol) {
        self.view = view
    }
    
}
