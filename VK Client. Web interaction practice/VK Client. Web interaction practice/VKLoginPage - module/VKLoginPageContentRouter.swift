//
//  VKLoginPageContentRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation


protocol VKLoginPageContentRouterProtocol {
    var view: VKLoginViewControllerProgrammaticallyMadeLayout! {get set}
    func moveToUserLoginScreen() -> Void

}

class VKLoginPageContentRouter: VKLoginPageContentRouterProtocol {
    weak var view: VKLoginViewControllerProgrammaticallyMadeLayout!

    init(view: VKLoginViewControllerProgrammaticallyMadeLayout) {
        self.view = view
    }

    func moveToUserLoginScreen() {
        let vc = MainTabBarModuleBuilder.build()
        view.view.window?.rootViewController = vc
    }
}

