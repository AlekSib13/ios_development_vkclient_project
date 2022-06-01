//
//  InitialCoverPageRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation


protocol InitialCoverPageRouterProtocol {
    func moveToLoginScreen()
    func moveToMainMenu(userData: UserAuthData)
}


class InitialCoverPageRouter: InitialCoverPageRouterProtocol {

    weak var vc: InitialCoverPageViewControllerProtocol?
    
    func moveToLoginScreen() {
        guard let currentVC = vc as? InitialCoverPageViewController else { return }
        let newVC = VKLoginPageContentModuleBuilder.build()
        currentVC.present(newVC, animated: true, completion: nil)
    }
    
    func moveToMainMenu(userData: UserAuthData) {
        guard let currentVC = vc as? InitialCoverPageViewController else { return }
        let newVC = MainTabBarModuleBuilder.build(user: userData)
        currentVC.view.window?.rootViewController = newVC
    }
}
