//
//  VKLoginPagePageInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import Foundation
import WebKit

protocol VKLoginPageContentInteractorProtocol {
    var presenter: VKLoginPageContentPresenterProtocol! {get set}
    var initialUrlWorker: VKInitialURLRequestProtocol {get}
    var realmDBWorker: ServiceDBRealmWritingReading {get}
    
    func makeURLRequestForUserAuthData(webView: WKWebView) -> Void
    func saveUserAuthData(receivedUserId userId: String, receivedToken token: String) -> Void
}

class VKLoginPageContentInteractor: VKLoginPageContentInteractorProtocol {
    weak var presenter: VKLoginPageContentPresenterProtocol!
    var apiWorker: ServiceVKAPIExtendedProtocol = ServiceVKAPIExtended()
    var initialUrlWorker: VKInitialURLRequestProtocol = VKInitialURLRequest()
    var realmDBWorker: ServiceDBRealmWritingReading = ServiceDBRealm()
    
    
    init(presenter: VKLoginPageContentPresenterProtocol) {
        self.presenter = presenter
    }
    
    func makeURLRequestForUserAuthData(webView: WKWebView) {
        initialUrlWorker.makeUrlRequest(webView: webView)
    }
    
    func saveUserAuthData(receivedUserId userId: String, receivedToken token: String) -> Void {
        let user = User(dataJSON: nil, userId: userId, tokenId: token)
        Singleton.shared.userId = userId
        Singleton.shared.token = token
        realmDBWorker.temporaryFuncWriteToDB(userAuthData: user)
    }
    
}
