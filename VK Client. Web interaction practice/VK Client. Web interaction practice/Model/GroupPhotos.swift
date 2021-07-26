//
//  GroupPhotos.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 07.07.2021.
//

import Foundation
import RealmSwift
import DynamicJSON




protocol GroupPhotoDataSource {
    var photoReference: String {get}
    var groupId: Int {get}
    var photoId: Int {get}
}


class GroupPhoto: Object, GroupPhotoDataSource {
    @objc dynamic var photoReference = ""
    @objc dynamic var groupId: Int = 0
    @objc dynamic var photoId: Int = 0
    
    let groups = LinkingObjects(fromType: Group.self, property: "photos")
    
    convenience init(dataJson: JSON){
        self.init()
        photoReference = dataJson.photo_orig.string as! String
        groupId = dataJson.groupId.int as! Int
        photoId = dataJson.id.int as! Int
    }
    
    override static func primaryKey() -> String? {
        return "photoId"
    }
}




// MARK: Part of the code, which referes to the previous versions of the app. This code will be withdrawn later
//protocol GroupPhotoDataSourceRealm {
//    var photoReference: String? {get}
//    var groupId: GroupRealm? {get}
//}
//
//
//class GroupPhotoRealm: Object, GroupPhotoDataSourceRealm {
//    @objc dynamic var photoReference: String?
//    @objc dynamic var groupId: GroupRealm?
//
//    convenience init(groupId: GroupRealm?, photoReference: String?) {
//        self.init()
//        self.photoReference = photoReference
//        self.groupId = groupId
//    }
//
//    override static func primaryKey() -> String? {
//        return "photoReference"
//    }
//}
