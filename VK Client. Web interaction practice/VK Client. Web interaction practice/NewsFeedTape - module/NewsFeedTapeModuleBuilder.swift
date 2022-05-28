//
//  NewsFeedTapeModuleBuilder.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation


class NewsFeedTapeModuleBuilder {
    
    static func build() -> NewsFeedTapeViewController {
        
        let router = NewsFeedTapeRouter()
        let interactor = NewsFeedTapeInteractor()
        let presenter = NewsFeedTapePresenter(interactor: interactor, router: router)
        let vc = NewsFeedTapeViewController(presenter: presenter)
        
        
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
        return vc
    }
}
