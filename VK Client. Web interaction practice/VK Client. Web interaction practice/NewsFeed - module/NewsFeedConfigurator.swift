//
//  NewsFeedConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation
import UIKit


protocol NewsFeedConfiguratorProtocol {
    
    var presenter: NewsFeedPresenterProtocol! {get set}
    var interactor: NewsFeedInteractorProtocol! {get set}
    var router: NewsFeedRouterProtocol! {get set}
    
    func configure(with viewController: NewsFeedViewController)
}



class NewsFeedConfigurator: NewsFeedConfiguratorProtocol {
    
    var presenter: NewsFeedPresenterProtocol!
    var interactor: NewsFeedInteractorProtocol!
    var router: NewsFeedRouterProtocol!
    
    func configure(with viewController: NewsFeedViewController) {
        
        presenter = NewsFeedPresenter(view: viewController)
        interactor = NewsFeedInteractor(presenter: presenter)
        router = NewsFeedRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}

