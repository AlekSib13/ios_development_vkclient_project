//
//  VKLoginPageContentRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation

protocol VKLoginPageContentRouterProtocol {
    func moveToMainMenu(for user: UserAuthData)

}

class VKLoginPageContentRouter: VKLoginPageContentRouterProtocol {
    
    weak var vc: VKLoginPageContentViewControllerProtocol?

    func moveToMainMenu(for user: UserAuthData) {
        guard let currentVC = vc as? VKLoginPageContentViewController else {return}
        let nextVC = MainTabBarModuleBuilder.build(user: user)
        currentVC.view.window?.rootViewController = nextVC
    }
}

