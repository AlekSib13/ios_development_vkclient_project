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
    
    weak var view: InitialCoverPageViewController?
    
    init(view: InitialCoverPageViewController) {
        self.view = view
    }
    
    func moveToLoginScreen() {
        view?.performSegue(withIdentifier: "ToVKLoginScreenUpdated", sender: nil)
    }
}
