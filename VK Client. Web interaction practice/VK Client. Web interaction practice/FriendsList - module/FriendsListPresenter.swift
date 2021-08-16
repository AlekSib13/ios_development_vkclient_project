//
//  FriendsListPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation
import UIKit


protocol FriendsListPresenterProtocol: AnyObject {
    var view: FriendsListViewControllerProtocol! {get}
    var interactor: FriendsListInteractorProtocol! {get set}
    var router: FriendsListRouterProtocol! {get set}
    
    func fetchFriendsList() -> Void
    func getFriendsListFromDB(cellIdentifier: String) -> Void
    func returnFriendsList(friendsListFromDB: [Friend]?) -> Void
    func returnLoadedImage(listOfImages: [UIImage]) -> Void
    func loadAvatarIntoCell(cellIndex: Int) -> UIImage?
}


class FriendsListPresenter: FriendsListPresenterProtocol {

    weak var view: FriendsListViewControllerProtocol!
    var interactor: FriendsListInteractorProtocol!
    var router: FriendsListRouterProtocol!
    var friendsList = [Friend]()
    
    init(view: FriendsListViewControllerProtocol) {
        self.view = view
    }
    
    func fetchFriendsList() {
        interactor.getFriendsListFromServer()
    }
    
    func getFriendsListFromDB(cellIdentifier: String) -> Void {
        interactor.getFriendsListFromDB(cellIdentifier: cellIdentifier)
    }
    
    func returnFriendsList(friendsListFromDB: [Friend]?) -> Void {
        view.returnFriendsList(friendsListFromDB: friendsListFromDB)
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

