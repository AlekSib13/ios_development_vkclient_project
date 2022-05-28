//
//  FriendsListConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation


class FriendslistModuleBuilder {
    
    var presenter: FriendsListPresenterProtocol!
    var interactor: FriendsListInteractorProtocol!
    var router: FriendsListRouterProtocol!
    
    static func build() -> UserFriendsListViewController {
        
        let router = FriendsListRouter()
        let interactor = FriendsListInteractor()
        let presenter = FriendsListPresenter(interactor: interactor, router: router)
        let vc = UserFriendsListViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}


