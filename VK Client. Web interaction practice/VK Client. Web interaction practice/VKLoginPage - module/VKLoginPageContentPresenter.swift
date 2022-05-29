//
//  VKLoginPageContentPresenter.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation
import WebKit



protocol VKLoginPageContentPresenterProtocol: AnyObject  {
    var view: VKLoginPageContentViewControllerProtocol? {get}
    var interactor: VKLoginPageContentInteractorProtocol! {get set}
    var router: VKLoginPageContentRouterProtocol! {get set}
    
    func fetchUserAuthData(urlFragment: String) -> Void
    func fetchContent(webView: WKWebView) -> Void
    
    func moveToUserLoginScreen() -> Void
}

class VKLoginPageContentPresenter: VKLoginPageContentPresenterProtocol {
    weak var view: VKLoginPageContentViewControllerProtocol?
    var interactor: VKLoginPageContentInteractorProtocol!
    var router: VKLoginPageContentRouterProtocol!
    
    init(view: VKLoginPageContentViewControllerProtocol) {
        self.view = view
    }
    
    func fetchContent(webView: WKWebView) {
        interactor.makeURLRequestForUserAuthData(webView: webView)
    }
    
    func fetchUserAuthData(urlFragment: String) {
        let params = urlFragment.components(separatedBy: "&").map{$0.components(separatedBy: "=")}.reduce([String:String]()){empty_dict,param in
            var dict = empty_dict
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
        }

        let token = params["access_token"]
        let userid = params["user_id"]
        
        if let tokenString = token, let useridString = userid {
            interactor.saveUserAuthData(receivedUserId: useridString, receivedToken: tokenString)}
        
        moveToUserLoginScreen()
    }
    
    func moveToUserLoginScreen() {
        router.moveToUserLoginScreen()
    }
}
