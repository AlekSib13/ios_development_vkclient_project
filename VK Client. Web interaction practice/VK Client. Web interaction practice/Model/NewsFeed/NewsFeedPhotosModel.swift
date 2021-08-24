//
//  NewsFeedPhotos.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 23.08.2021.
//

import Foundation
import RealmSwift


protocol NewsFeedPhotosProtocol {
    var ownerId: Int {get}
    var photoId: Int {get}
    var photoLink: String {get}
}

class NewsFeedPhotos: EmbeddedObject, NewsFeedPhotosProtocol {
    @objc dynamic var ownerId = 0
    @objc dynamic var photoId = 0
    @objc dynamic var photoLink = ""
    
    convenience init(ownerIdFromJSON: Int, photoIdFromJSON: Int, photoLinkFromJSON: String) {
        self.init()
        ownerId = ownerIdFromJSON
        photoId = photoIdFromJSON
        photoLink = photoLinkFromJSON
    }
}
