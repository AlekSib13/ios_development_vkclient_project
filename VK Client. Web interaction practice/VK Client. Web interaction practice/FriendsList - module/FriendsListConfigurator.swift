//
//  FriendsListConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation


protocol FriendsListConfiguratorProtocol {
    
    var presenter: FriendsListPresenterProtocol! {get}
    var interactor: FriendsListInteractorProtocol! {get}
    var router: FriendsListRouterProtocol! {get}
    
    func configure(with: UserFriendsListViewController)
}


class FriendslistConfigurator: FriendsListConfiguratorProtocol {
    
    var presenter: FriendsListPresenterProtocol!
    var interactor: FriendsListInteractorProtocol!
    var router: FriendsListRouterProtocol!
    
    func configure(with viewController: UserFriendsListViewController) {
        presenter = FriendsListPresenter(view: viewController)
        interactor = FriendsListInteractor(presenter: presenter)
        router = FriendsListRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}


