//
//  UserGroupsListPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 16.08.2021.
//

import Foundation
import UIKit


protocol UserGroupsListPresenterProtocol: AnyObject {
    var view: UserGroupsListViewControllerProtocol! {get}
    var interactor: UserGroupsListInteractorProtocol! {get set}
    var router: UserGroupsListRouterProtocol! {get set}
    
    func fetchUserGroupsList() -> Void
    func getUserGroupsListFromDB(cellIdentifier: String) -> Void
    func returnUserGroupsList(userGroupsListFromDB: [Group]?) -> Void
    func returnLoadedImage(listOfImages: [UIImage]) -> Void
    func loadAvatarIntoCell(cellIndex: Int) -> UIImage?
}


class UserGroupsListPresenter: UserGroupsListPresenterProtocol {
   
    weak var view: UserGroupsListViewControllerProtocol!
    var interactor: UserGroupsListInteractorProtocol!
    var router: UserGroupsListRouterProtocol!
    
    init(view: UserGroupsListViewControllerProtocol) {
        self.view = view
    }
    
    func fetchUserGroupsList() -> Void {
        interactor.getUserGroupsListFromServer()
    }
    
    func getUserGroupsListFromDB(cellIdentifier: String) -> Void {
        interactor.getUserGroupsListFromDB(cellIdentifier: cellIdentifier)
    }
    
    func returnUserGroupsList(userGroupsListFromDB: [Group]?) -> Void {
        view.returnUserGroupsList(userGroupsListFromDB: userGroupsListFromDB)
    }
    
    func returnLoadedImage(listOfImages: [UIImage]) -> Void {
        view.returnLoadedImage(listOfImages: listOfImages)
    }
    
    func loadAvatarIntoCell(cellIndex: Int) -> UIImage? {
        if view.listOfAvatars != nil {
            guard let listOfAvatars = view.listOfAvatars else  {
                guard let image = UIImage(named: "no_img") else {return nil}
                return image}
            let image = listOfAvatars[cellIndex]
            return image
        } else {
            guard let image = UIImage(named: "no_img") else {return nil}
            return image}
    }
}
