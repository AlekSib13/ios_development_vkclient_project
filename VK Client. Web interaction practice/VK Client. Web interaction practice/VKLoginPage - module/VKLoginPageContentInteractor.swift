//
//  VKLoginPagePageInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation
import WebKit

protocol VKLoginPageContentInteractorProtocol {
    var url: URLRequest {get}
    func saveCredentials(of user: UserAuthData)
}

class VKLoginPageContentInteractor: VKLoginPageContentInteractorProtocol {
   
    weak var presenter: VKLoginPageContentPresenterProtocol?
    let manager: AuthManagerProtocol
    var url: URLRequest {
        manager.getAuthUrl()
    }
    
    
    init(manager: AuthManagerProtocol) {
        self.manager = manager
    }
    
    
    func saveCredentials(of user: UserAuthData) {
        manager.writeUserAuthData(userCredentials: user)
    }
    
}
