//
//  RealmDBService + UserToken.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.05.2022.
//

import Foundation


protocol UserAuthDataDBManagerProtocol: BaseRealm {
    func writeUserAuthData(userData: UserAuthData)
    func readUserAuthData(userCredentials: UserAuthData?, callback: @escaping (Result<UserAuthData, Error>) -> Void)
}

extension RealmDBManagerService: UserAuthDataDBManagerProtocol {
  
    func writeUserAuthData(userData: UserAuthData) {
        let threadSecondary = Thread {[weak self] in
            guard let self = self else {return}
            let realm = self.realmDB
            do {try realm.write {
                let object = RmUserAuthData()
                realm.add(object.fromModel(userData), update: .modified)}
            } catch {
                print("Could not write user auth data to db")
            }
        }
        
        threadSecondary.qualityOfService = .utility
        threadSecondary.start()
    }
    
    
    func readUserAuthData(userCredentials: UserAuthData?, callback: @escaping (Result<UserAuthData, Error>) -> Void) {
        DispatchQueue.global().async {[weak self] in
            guard let self = self else {return}
            let realm = self.realmDB
            if let userCredentials = userCredentials {
                guard let user = realm.objects(RmUserAuthData.self).filter("userName == \(userCredentials.userName) && userPassword == \(userCredentials.userPassword)").first else {
                    DispatchQueue.main.async {
                        callback(.failure(self.runNoUserError()))
                    }
                    return
                }
                let userModel = user.toModel()
                DispatchQueue.main.async {
                    callback(.success(userModel))
                }
            } else {
                guard let user = realm.objects(RmUserAuthData.self).first else {
                    DispatchQueue.main.async {
                        callback(.failure(self.runNoUserError()))
                    }
                    return
                }
                let userModel = user.toModel()
                DispatchQueue.main.async {
                    callback(.success(userModel))
                }
            }
        }
    }
    
    
    private func runNoUserError() -> Error {
        let errorNoUserWithCredentials = NSError(domain: AppErrors.description, code: AppErrors.noUserWithCredentials.rawValue, userInfo: [NSLocalizedDescriptionKey: AppErrors.noUserWithCredentials.describeError()])
        
        return errorNoUserWithCredentials
    }
}
