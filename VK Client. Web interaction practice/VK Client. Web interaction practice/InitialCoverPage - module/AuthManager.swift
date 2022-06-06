//
//  AuthManager.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 01.06.2022.
//

import Foundation


protocol AuthManagerProtocol {
    func readUserAuthData(userCredentials: UserAuthData?, callback: @escaping (Result<UserAuthData, Error>) -> Void)
    func writeUserAuthData(userCredentials: UserAuthData)
    func getAuthUrl() -> URLRequest
    
}

class AuthManager: AuthManagerProtocol {
    
    let rest: RestAPIAuth
    let dbManager: UserAuthDataDBManagerProtocol
    
    init(rest: RestAPIAuth, dbManager: UserAuthDataDBManagerProtocol) {
        self.dbManager = dbManager
        self.rest = rest
    }
    
    
    func readUserAuthData(userCredentials: UserAuthData?, callback: @escaping (Result<UserAuthData, Error>) -> Void) {
        dbManager.readUserAuthData(userCredentials: userCredentials, callback: callback)
    }
    
    func writeUserAuthData(userCredentials: UserAuthData) {
        dbManager.writeUserAuthData(userData: userCredentials)
    }
    
    func getAuthUrl() -> URLRequest {
        rest.getAuthUrl()
    }
}
