//
//  NewsFeedPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation

protocol NewsFeedPresenterProtocol {
    var view: NewsFeedViewControllerProtocol! {get set}
}

class NewsFeedPresenter: NewsFeedPresenterProtocol {
    weak var view: NewsFeedViewControllerProtocol!
    
    init(view: NewsFeedViewControllerProtocol){
        self.view = view
    }
}
