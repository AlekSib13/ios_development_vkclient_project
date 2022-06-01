//
//  InitialCoverPagePresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation


protocol InitialCoverPagePresenterProtocol: AnyObject {
    func moveToLoginScreen()
    func loadingStarted()
    func useUserAuthData(userData: UserAuthData?)
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
    
    
    func useUserAuthData(userData: UserAuthData?) {
        vc?.stopLoader()
        guard let userData = userData else {
            router.moveToLoginScreen()
            return
        }
        router.moveToMainMenu(userData: userData)
    }
}
