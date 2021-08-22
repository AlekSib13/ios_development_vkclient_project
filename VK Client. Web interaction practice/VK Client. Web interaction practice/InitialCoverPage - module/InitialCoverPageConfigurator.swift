//
//  InitialCoverPageController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation

protocol InitialCoverPageConfiguratorProtocol {
    var presenter: InitialCoverPagePresenterProtocol! {get}
    var interactor: InitialCoverPageInteractorProtocol! {get}
    var router: InitialCoverPageRouterProtocol! {get}
    
    func configure(with viewController: InitialCoverPageViewController) -> Void
}

class InitialCoverPageConfigurator: InitialCoverPageConfiguratorProtocol {
    var presenter: InitialCoverPagePresenterProtocol!
    var interactor: InitialCoverPageInteractorProtocol!
    var router: InitialCoverPageRouterProtocol!
    
    func configure(with viewController: InitialCoverPageViewController) {
        presenter = InitialCoverPagePresenter(view: viewController)
        interactor = InitialCoverPageInteractor(presenter: presenter)
        router = InitialCoverPageRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
