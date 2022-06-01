//
//  VKLoginPageContentconfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation

protocol VKLoginPageContentConfigurfatorProtocol {
}

class VKLoginPageContentModuleBuilder {

    static func build() -> VKLoginPageContentViewController {
        let router = VKLoginPageContentRouter()
        let interactor = VKLoginPageContentInteractor(manager: AuthManager(rest: RestAPI.instance, dbManager: RealmDBManagerService.instance))
        let presenter = VKLoginPageContentPresenter(interactor: interactor, router: router)
        let vc = VKLoginPageContentViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}
