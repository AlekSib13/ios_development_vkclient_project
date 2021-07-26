//
//  Groups.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 02.07.2021.
//

import Foundation
import UIKit
import RealmSwift
import DynamicJSON




protocol GroupDataSource {
    var groupId: Int {get}
    var groupName: String? {get set}
    var groupAvatar: String? {get set}
}

class Group: Object, GroupDataSource {
    @objc dynamic var groupId = 0
    @objc dynamic var groupName: String?
    @objc dynamic var groupAvatar: String?
    
    var photos = List<GroupPhoto>()
    
    convenience init(dataJSON: JSON){
        self.init()
        groupId = dataJSON.id.int as! Int
        groupName = dataJSON.name.string as? String
        groupAvatar = dataJSON.photo_100.string as? String}
    
    override static func primaryKey() -> String? {
        return "groupId"
    }
}


// MARK: Part of the code, which referes to the previous versions of the app. This code will be withdrawn later

//protocol GroupDataSource {
//    var id: UInt {get}
//    var name: String {get}
//    var avatar: UIImage? {get}
//}
//
//class Group: GroupDataSource {
//    let id: UInt
//    var name: String
//    var avatar: UIImage?
//
//    init(id: UInt, name: String, avatar: UIImage?) {
//        self.id = id
//        self.name = name
//        self.avatar = avatar
//    }
//}



//protocol GroupDataSourceRealm {
//    var id: Int {get}
//    var name: String? {get}
//}
//
//class GroupRealm: Object, GroupDataSourceRealm {
//    @objc dynamic var id: Int = 0
//    @objc dynamic var name: String?
//
//    let users = LinkingObjects(fromType: UserRealm.self, property: "groups")
//    let friends = LinkingObjects(fromType: FriendRealm.self, property: "groups")
//
//
//    convenience init(id: Int, name: String?) {
//        self.init()
//        self.id = id
//        self.name = name
//    }
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//}
