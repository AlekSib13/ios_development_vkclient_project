//
//  NewsFeedRouter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation


protocol NewsFeedRouterProtocol {
    var view: NewsFeedViewControllerProtocol! {get set}
}

class NewsFeedRouter: NewsFeedRouterProtocol {
    weak var view: NewsFeedViewControllerProtocol!
    
    init(view: NewsFeedViewControllerProtocol) {
        self.view = view
    }
    
}

