//
//  NewsFeedConfigurator.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import Foundation
import UIKit


protocol NewsFeedConfigurationProtocol {
    
    var interactor: NewsFeedInteractorProtocol! {get set}
    var presenter: NewsFeedPresenterProtocol! {get set}
    var router: NewsFeedRouterProtocol! {get set}
    var apiWorker: ServiceVKAPIExtendedProtocol! {get set}
    var realmDBWorker: ServiceDBRealmWritingReading! {get set}
    
    func configure(with viewController: NewsFeedViewController)
}


class NewsFeedConfiguration: NewsFeedConfigurationProtocol {
    
    var interactor: NewsFeedInteractorProtocol!
    var presenter: NewsFeedPresenterProtocol!
    var router: NewsFeedRouterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol!
    var realmDBWorker: ServiceDBRealmWritingReading!
    
    func configure(with viewController: NewsFeedViewController) {
        interactor = NewsFeedInteractor()
        presenter = NewsFeedPresenter(view: viewController)
        router = NewsFeedRouter(view: viewController)
        apiWorker = ServiceVKAPIExtended()
        realmDBWorker = ServiceDBRealm()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.apiWorker = apiWorker
    }
    
    
}
