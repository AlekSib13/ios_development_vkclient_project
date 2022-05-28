//
//  NewsFeedTapePresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation


protocol NewsFeedTapePresenterProtocol: AnyObject {
}


class NewsFeedTapePresenter: NewsFeedTapePresenterProtocol {
    
    let interactor: NewsFeedTapeInteractorProtocol
    let router: NewsFeedTapeRouterProtocol
    weak var vc: NewsFeedTapeViewControllerProtocol?
    
    
    init(interactor: NewsFeedTapeInteractorProtocol, router: NewsFeedTapeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
