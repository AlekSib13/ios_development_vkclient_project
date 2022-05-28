//
//  FriendsListPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 13.08.2021.
//

import Foundation
import UIKit


protocol FriendsListPresenterProtocol: AnyObject {
    func fetchFriendsList() -> Void
    func getFriendsListFromDB(cellIdentifier: String) -> Void
    func returnFriendsList(friendsListFromDB: [Friend]?) -> Void
    func returnLoadedImage(listOfImages: [UIImage]) -> Void
    func loadAvatarIntoCell(cellIndex: Int) -> UIImage?
}


class FriendsListPresenter: FriendsListPresenterProtocol {

    let interactor: FriendsListInteractorProtocol
    let router: FriendsListRouterProtocol
    weak var vc: FriendsListViewControllerProtocol?
    
    var friendsList = [Friend]()
    
    init(interactor: FriendsListInteractorProtocol, router: FriendsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchFriendsList() {
        interactor.getFriendsListFromServer()
    }
    
    func getFriendsListFromDB(cellIdentifier: String) -> Void {
        interactor.getFriendsListFromDB(cellIdentifier: cellIdentifier)
    }
    
    func returnFriendsList(friendsListFromDB: [Friend]?) -> Void {
        vc?.returnFriendsList(friendsListFromDB: friendsListFromDB)
    }
    
    func returnLoadedImage(listOfImages: [UIImage]) -> Void {
        vc?.returnLoadedImage(listOfImages: listOfImages)
    }
    
    
    func loadAvatarIntoCell(cellIndex: Int) -> UIImage? {
        if vc?.listOfAvatars != nil {
            guard let listOfAvatars = vc?.listOfAvatars else  {
                guard let image = UIImage(named: "no_img") else {return nil}
                return image}
            let image = listOfAvatars[cellIndex]
            return image
        } else {
            guard let image = UIImage(named: "no_img") else {return nil}
            return image}
    }
}

