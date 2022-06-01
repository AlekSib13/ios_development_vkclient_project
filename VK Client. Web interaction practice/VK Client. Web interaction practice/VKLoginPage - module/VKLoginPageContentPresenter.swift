//
//  VKLoginPageContentPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation
import WebKit



protocol VKLoginPageContentPresenterProtocol: AnyObject  {
    func getTransitionURL() -> URLRequest
    func authDataToHandle(url: String)
}

class VKLoginPageContentPresenter: VKLoginPageContentPresenterProtocol {
  
    weak var vc: VKLoginPageContentViewControllerProtocol?
    var interactor: VKLoginPageContentInteractorProtocol
    var router: VKLoginPageContentRouterProtocol
    
    init(interactor: VKLoginPageContentInteractorProtocol, router: VKLoginPageContentRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func getTransitionURL() -> URLRequest {
        interactor.url
    }
    
    
    func authDataToHandle(url: String) {
        
        guard let startindex = url.firstIndex(of: "#") else {return}
        let credentials = url[ url.index(after: startindex)...]
        let elementsOfCredentials = credentials.split(separator: "&")
        guard let tokenStr = elementsOfCredentials.first, let userIdStr = elementsOfCredentials.last else {
            return
        }
        
        let tokenArr = tokenStr.split(separator: "=")
        let userIdArr = userIdStr.split(separator: "=")
        
        guard let tokenValue = tokenArr.last, let userIdValue = userIdArr.last else {return}
        
        let user = UserAuthData(userName: "defaultUser", userPassword: "no password", userId: String(userIdValue), userToken: String(tokenValue))
        
        interactor.saveCredentials(of: user)
        router.moveToMainMenu(for: user)
    }
}
