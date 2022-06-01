//
//  InitialCoverPageController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation


class InitialCoverPageModuleBuilder {

    static func build() -> InitialCoverPageViewController {
        let router = InitialCoverPageRouter()
        let interactor = InitialCoverPageInteractor(manager: AuthManager(rest: RestAPI.instance, dbManager: RealmDBManagerService.instance))
        let presenter = InitialCoverPagePresenter(interactor: interactor, router: router)
        let vc = InitialCoverPageViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}
