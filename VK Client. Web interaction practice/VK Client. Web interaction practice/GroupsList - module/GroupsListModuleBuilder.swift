//
//  GroupsListModuleBuilder.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation


class GroupListModuleBuilder {
    
    static func build(user: UserAuthData) -> GroupsListViewController  {
        let router = GroupsListRouter()
        let interactor = GroupsListInteractor()
        let presenter = GroupsListPresenter(interactor: interactor, router: router)
        let vc = GroupsListViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}
