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
        //here transition to main module
//        view.performSegue(withIdentifier: "ToMainScreenUpdated", sender: nil)
        let vc = MainTabBarModuleBuilder.build()
        view.view.window?.rootViewController = vc
    }
}


// MARK: Previous version of router
//protocol VKLoginPageContentRouterProtocol {
//    var view: VKLoginPageContentViewController! {get set}
//    func moveToUserLoginScreen() -> Void
//
//}
//
//class VKLoginPageContentRouter: VKLoginPageContentRouterProtocol {
//    weak var view: VKLoginPageContentViewController!
//
//    init(view: VKLoginPageContentViewController) {
//        self.view = view
//    }
//
//    func moveToUserLoginScreen() {
////        view.performSegue(withIdentifier: "ToMainScreen", sender: nil)
//        view.performSegue(withIdentifier: "ToMainScreen", sender: nil)
//    }
//}
