//
//  RmUserAuthData.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.05.2022.
//

import Foundation
import RealmSwift

class RmUserAuthData: Object {
    @objc dynamic var userName = ""
    @objc dynamic var userPassword = ""
    @objc dynamic var userId = ""
    @objc dynamic var userToken = ""
    
    
    func fromModel(_ user: UserAuthData) -> RmUserAuthData {
        self.userName = user.userName
        self.userPassword = user.userPassword
        self.userId = user.userId
        self.userToken = user.userToken
        return self
    }
    
    func toModel() -> UserAuthData {
        UserAuthData(userName: "", userPassword: "", userId: self.userId, userToken: self.userToken)
    }
    
    override static func primaryKey() -> String? {
        "userId"
    }
}
