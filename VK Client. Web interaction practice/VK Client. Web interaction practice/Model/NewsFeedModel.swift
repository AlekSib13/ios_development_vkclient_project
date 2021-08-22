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
    var newsNumberOfLikes: Int {get set}
    var newsText: String? {get set}
//    var newsImageLink: String? {get set}
//    var newsNumberOfViews: Int {get set}
}

class News: Object,NewsDataSource {

    @objc dynamic var newsId = 0
    @objc dynamic var sourceId = 0
    @objc dynamic var newsDateTime = NSDate()
    @objc dynamic var newsNumberOfLikes = 0
    @objc dynamic var newsText: String?
//    @objc dynamic var newsImageLink: String?
//    @objc dynamic var newsNumberOfViews = 0
    
    
    convenience init(dataJSON: JSON){
        self.init()
        newsId = dataJSON.post_id.int as! Int
        sourceId = abs(dataJSON.source_id.int as! Int)
        newsDateTime = NSDate(timeIntervalSince1970: dataJSON.date.double as! Double)
        newsNumberOfLikes = dataJSON.likes.count.int as? Int ?? 0
        newsText = dataJSON.text.string
    }
    
    override static func primaryKey() -> String? {
        return "newsId"
    }
    
}
