//
//  NewsFeedModel.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 30.07.2021.
//

import Foundation
import RealmSwift
import DynamicJSON


protocol NewsDataSource {
    var newsId: Int {get}
    var sourceId: Int {get}
    var newsDateTime: NSDate {get}
    var newsDateTimeUnix: Int {get}
    var newsNumberOfLikes: Int {get set}
    var newsText: String? {get set}
    var numberOfViews: Int {get set}
//    var newsImageLink: String? {get set}
//    var newsNumberOfViews: Int {get set}
//    var photos: List<NewsFeedPhotos> {get set}
}

class News: Object,NewsDataSource {
    @objc dynamic var newsId = 0
    @objc dynamic var sourceId = 0
    @objc dynamic var newsDateTime = NSDate()
    @objc dynamic var newsDateTimeUnix = 0
    @objc dynamic var newsNumberOfLikes = 0
    @objc dynamic var newsText: String?
    @objc dynamic var numberOfViews = 0
    
//    @objc dynamic var newsImageLink: String?
//    @objc dynamic var newsNumberOfViews = 0
    
    let groupsNews = LinkingObjects(fromType: Friend.self, property: "news")
    let friendsNews = LinkingObjects(fromType: Group.self, property: "news")
    
    var photos = List<NewsFeedPhotos>()
    
    
    convenience init(dataJSON: JSON){
        self.init()
        newsId = dataJSON.post_id.int as? Int ?? -1
        sourceId = abs(dataJSON.source_id.int as! Int)
        newsDateTime = NSDate(timeIntervalSince1970: dataJSON.date.double as! Double)
        newsDateTimeUnix = dataJSON.date.int as? Int ?? 0
        newsNumberOfLikes = dataJSON.likes.count.int as? Int ?? 0
        newsText = dataJSON.text.string
        numberOfViews = dataJSON.views.count.int as? Int ?? 0
        
        guard let attachments = dataJSON.attachments.array else {return}
        for attachment in attachments {
            if attachment.type.string == "photo" {
                let newsFeedPhoto = NewsFeedPhotos(ownerIdFromJSON: abs(attachment.photo.owner_id.int as! Int), photoIdFromJSON: attachment.photo.id.int as! Int, photoLinkFromJSON: attachment.photo.sizes[0].url.string as! String)
                photos.append(newsFeedPhoto)
            } else {continue}
        }
    }
    
    override static func primaryKey() -> String? {
        return "newsId"
    }
    
}
