//
//  MainTabBarPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation


protocol MainTabBarPresenterProtocol: AnyObject {
}


class MainTabBarPresenter: MainTabBarPresenterProtocol {
    
    let interactor: MainTabBarInteractorProtocol
    let router: MainTabBarRouterProtocol
    weak var vc: MainTabBarViewControllerProtocol?
    
    init(interactor: MainTabBarInteractorProtocol, router: MainTabBarRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
