//
//  VKLoginPageContentconfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation

protocol VKLoginPageContentConfigurfatorProtocol {
    var presenter: VKLoginPageContentPresenterProtocol! {get set}
    var interactor: VKLoginPageContentInteractorProtocol! {get set}
    var router: VKLoginPageContentRouterProtocol! {get set}
    
    func configure(with viewController: VKLoginViewControllerProgrammaticallyMadeLayout) -> Void
}

class VKLoginPageContentConfigurfator: VKLoginPageContentConfigurfatorProtocol {
    var presenter: VKLoginPageContentPresenterProtocol!
    var interactor: VKLoginPageContentInteractorProtocol!
    var router: VKLoginPageContentRouterProtocol!
    
    
    func configure(with viewController: VKLoginViewControllerProgrammaticallyMadeLayout) {
        presenter = VKLoginPageContentPresenter(view: viewController)
        interactor = VKLoginPageContentInteractor(presenter: presenter)
        router = VKLoginPageContentRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}



// MARK: Previous version of configuration
//    func configure(with viewController: VKLoginPageContentViewController) -> Void

//    func configure(with viewController: VKLoginPageContentViewController) {
//        presenter = VKLoginPageContentPresenter(view: viewController)
//        interactor = VKLoginPageContentInteractor(presenter: presenter)
//        router = VKLoginPageContentRouter(view: viewController)
//
//        viewController.presenter = presenter
//        presenter.interactor = interactor
//        presenter.router = router
//    }
