//
//  InitialCoverPagePresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation


protocol InitialCoverPagePresenterProtocol: AnyObject {
    var view: InitialCoverPageViewControllerProtocol? {get}
    var interactor: InitialCoverPageInteractorProtocol! {get set}
    var router: InitialCoverPageRouterProtocol! {get set}
    
    func moveToLoginScreen() -> Void
}


class InitialCoverPagePresenter: InitialCoverPagePresenterProtocol {
    
    weak var view: InitialCoverPageViewControllerProtocol?
    var interactor: InitialCoverPageInteractorProtocol!
    var router: InitialCoverPageRouterProtocol!
    
    init(view: InitialCoverPageViewControllerProtocol) {
        self.view = view
    }
    
    func moveToLoginScreen() {
        router.moveToLoginScreen()
    }
}
