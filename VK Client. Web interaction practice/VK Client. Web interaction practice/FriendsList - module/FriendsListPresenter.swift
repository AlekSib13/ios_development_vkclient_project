//
//  FriendsListPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation
import UIKit


protocol FriendsListPresenterProtocol: AnyObject {
}


class FriendsListPresenter: FriendsListPresenterProtocol {

    let interactor: FriendsListInteractorProtocol
    let router: FriendsListRouterProtocol
    weak var vc: FriendsListViewControllerProtocol?
    
    init(interactor: FriendsListInteractorProtocol, router: FriendsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

