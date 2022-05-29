//
//  InitialCoverPagePresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation


protocol InitialCoverPagePresenterProtocol: AnyObject {
    func moveToLoginScreen() -> Void
    func loadingStarted()
}


class InitialCoverPagePresenter: InitialCoverPagePresenterProtocol {
    
    var interactor: InitialCoverPageInteractorProtocol
    var router: InitialCoverPageRouterProtocol
    weak var vc: InitialCoverPageViewControllerProtocol?
    
    init(interactor: InitialCoverPageInteractorProtocol, router: InitialCoverPageRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func moveToLoginScreen() {
        router.moveToLoginScreen()
    }
    
    func loadingStarted() {
        vc?.launchLoader()
    }
}
