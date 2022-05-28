//
//  MainTabBarBuilder.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation


class MainTabBarModuleBuilder {
    
    static func build() -> MainTabBarViewController {
        
        let router = MainTabBarRouter()
        let interactor = MainTabBarInteractor()
        let presenter = MainTabBarPresenter(interactor: interactor, router: router)
        let vc = MainTabBarViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}
