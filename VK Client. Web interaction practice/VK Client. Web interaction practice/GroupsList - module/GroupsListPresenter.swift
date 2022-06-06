//
//  GroupsListPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation


protocol GroupsListPresenterProtocol: AnyObject {}


class GroupsListPresenter: GroupsListPresenterProtocol {
    
    let interactor: GroupsListInteractorProtocol
    let router: GroupsListRouterProtocol
    weak var vc: GroupsListViewControllerProtocol?
    
    init(interactor: GroupsListInteractorProtocol, router: GroupsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}
