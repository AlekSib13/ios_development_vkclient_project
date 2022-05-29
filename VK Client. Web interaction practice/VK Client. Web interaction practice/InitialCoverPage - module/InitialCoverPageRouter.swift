//
//  InitialCoverPageRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation


protocol InitialCoverPageRouterProtocol {
    var view: InitialCoverPageViewController? {get}
    
    func moveToLoginScreen() -> Void
}


class InitialCoverPageRouter: InitialCoverPageRouterProtocol {
    
    weak var vc: InitialCoverPageViewController?
    
    func moveToLoginScreen() {
//        view?.performSegue(withIdentifier: "ToVKLoginScreenUpdated", sender: nil)
        
        view?.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: true, completion: nil)
    }
}
