//
//  FriendPhotos.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 07.07.2021.
//

import Foundation
import RealmSwift
import DynamicJSON




protocol FriendPhotoDataSource {
    var photoReference: String {get}
    var userId: Int {get}
    var photoId: Int {get}
}

class FriendPhoto: Object, FriendPhotoDataSource {
    @objc dynamic var photoReference: String = ""
    @objc dynamic var userId = 0
    @objc dynamic var photoId = 0
    
    let friends = LinkingObjects(fromType: Friend.self, property: "photos")
    
    convenience init(dataJSON: JSON){
        self.init()
        photoReference = dataJSON.photo_orig.string as! String
        userId = dataJSON.user_id as! Int
        photoId = dataJSON.id as! Int
    }
    
    override static func primaryKey() -> String? {
        return "photoId"
    }
    
}

// MARK: Part of the code, which referes to the previous versions of the app. This code will be withdrawn later
//protocol FriendPhotoDataSourceRealm: Object {
//    var photoReference: String? {get}
//    var friendId: FriendRealm? {get}
//}
//
//
//class FriendPhotoRealm: Object, FriendPhotoDataSourceRealm {
//    @objc dynamic var photoReference: String?
//    @objc dynamic var friendId: FriendRealm?
//
//    convenience init(friendId: FriendRealm?, photoReference: String?) {
//        self.init()
//        self.photoReference = photoReference
//        self.friendId = friendId
//    }
//
//    override static func primaryKey() -> String? {
//        return "photoReference"
//    }
//}
