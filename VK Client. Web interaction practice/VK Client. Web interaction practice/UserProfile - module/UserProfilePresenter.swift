//
//  UserProfilePresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//

import Foundation


protocol UserProfilePresenterProtocol: AnyObject {}

class UserProfilePresenter: UserProfilePresenterProtocol {
    
    let interactor: UserProfileInteractorProtocol?
    let router: UserProfileRouterProtocol?
    weak var vc: UserProfileViewControllerProtocol?
    
    init(interactor: UserProfileInteractorProtocol, router: UserProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
