//
//  NewsFeedPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation

protocol NewsFeedPresenterProtocol: AnyObject {
    var view: NewsFeedViewControllerProtocol! {get set}
    var interactor: NewsFeedInteractorProtocol! {get set}
    var router: NewsFeedRouterProtocol! {get set}
    
    func fetchNews() -> Void
}

class NewsFeedPresenter: NewsFeedPresenterProtocol {
    weak var view: NewsFeedViewControllerProtocol!
    var interactor: NewsFeedInteractorProtocol!
    var router: NewsFeedRouterProtocol!
    
    init(view: NewsFeedViewControllerProtocol){
        self.view = view
    }
    
    func fetchNews() -> Void {
        interactor.getNewsFeedFromServer()
    }
}
