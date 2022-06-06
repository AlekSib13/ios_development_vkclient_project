//
//  FriendsListConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation


class FriendsListModuleBuilder {
    
    static func build(user: UserAuthData) -> UserFriendsListViewController {
        
        let router = FriendsListRouter()
        let interactor = FriendsListInteractor(manager: FriendsListManager(rest: RestAPI.instance), user: user)
        let presenter = FriendsListPresenter(interactor: interactor, router: router)
        let vc = UserFriendsListViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}


