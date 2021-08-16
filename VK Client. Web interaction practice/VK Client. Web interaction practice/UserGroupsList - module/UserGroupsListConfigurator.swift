//
//  UserGroupsListConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 16.08.2021.
//

import Foundation

protocol UserGroupsListConfiguratorProtocol {
    var presenter: UserGroupsListPresenterProtocol! {get}
    var interactor: UserGroupsListInteractorProtocol! {get}
    var router: UserGroupsListRouterProtocol! {get}
    
    func configure(with viewController: UserGroupsListViewControllerProtocol) -> Void
}


class UserGroupsListConfigurator: UserGroupsListConfiguratorProtocol {
    var presenter: UserGroupsListPresenterProtocol!
    var interactor: UserGroupsListInteractorProtocol!
    var router: UserGroupsListRouterProtocol!
    
    func configure(with viewController: UserGroupsListViewControllerProtocol) {
        presenter = UserGroupsListPresenter(view: viewController)
        interactor = UserGroupsListInteractor(presenter: presenter)
        router = UserGroupsListRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
