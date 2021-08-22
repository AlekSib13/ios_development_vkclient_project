//
//  UserProfile.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//

import Foundation
import UIKit
import RealmSwift
import DynamicJSON

protocol UserDataSource {
    var userId: Int {get}
    var userToken: String? {get set}
    var firstName: String? {get set}
    var lastName: String? {get set}
    var sex: Int {get set}
    var birthday: String? {get set}
    var city: String? {get set}
    var country: String? {get set}
    var phone: String? {get set}
}


class User: Object, UserDataSource {

    @objc dynamic var userId = 0
    @objc dynamic var userToken: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var sex = 0
    @objc dynamic var birthday: String?
    @objc dynamic var city: String?
    @objc dynamic var country: String?
    @objc dynamic var phone: String?
    
    convenience init(dataJSON: JSON?, userId: String, tokenId: String?) {
        self.init()
        self.userId = Int(userId) ?? 0
        self.userToken = tokenId
        }
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}
