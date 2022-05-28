//
//  UserProfileConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//

import Foundation


class UserProfileModuleBuilder {
    
    static func build() -> UserProfileViewController {
        let router = UserProfileRouter()
        let interactor = UserProfileInteractor()
        let presenter = UserProfilePresenter(interactor: interactor, router: router)
        let vc = UserProfileViewController(presenter: presenter)
        
        interactor.presenter = presenter
        router.vc = vc
        presenter.vc = vc
        
        return vc
    }
}
