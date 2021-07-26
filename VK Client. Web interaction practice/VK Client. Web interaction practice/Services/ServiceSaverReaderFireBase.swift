//
//  SaverReaderFireBaseService.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 16.07.2021.
//

import Foundation
import Firebase

//MARK: The work on the class is currently being in progress

//class SaverReaderFireBaseService {
//    private var storage = Storage.storage().reference()
//    static var usersPhotos = [String: UIImage]()
//
//    func saveToFireBaseStorageAvatar(listOfPhotos: [String:String?]) -> Void {
//
//        for key in listOfPhotos.keys {
//            guard let imageLink = listOfPhotos[key], let imageLinkString = imageLink else {continue}
//
//            let downloadedImage: UIImage? = {(imageLink: String) in
//                let imageUrl = URL(string: imageLink)
//                let image = try? Data(contentsOf: imageUrl!)
//                guard let imageData = image else {return nil}
//                let uiImage = UIImage(data: imageData)
//                return uiImage}(imageLinkString)
//
//            guard let image = downloadedImage, let imageJpeg = image.jpegData(compressionQuality: 0.75) else {continue}
//
//            let fullPath = storage.child("\(String(key))/avatar.jpg")
//            let metadata = StorageMetadata.init()
//            metadata.customMetadata = [String(key):imageLinkString]
//            fullPath.putData(imageJpeg, metadata: metadata)
//        }
//    }
//
//    func saveImagesToIntermediateStorage(userIds: Array<AnyObject>) -> Void {
//        for entity in userIds {
//            guard let userId = entity.id else {continue}
//            let fullPath = storage.child("\(String(userId))/avatar.jpg")
//            DispatchQueue.main.async {
//                fullPath.getData(maxSize: 4*1024*1024){
//                    data,error in
//                    if error != nil {return} else {
//                        guard let data = data, let image = UIImage(data: data) else {return}
//                        SaverReaderFireBaseService.usersPhotos[String(userId)] = image
//                    }
//                }
//            }
//        }
//    }
//}


