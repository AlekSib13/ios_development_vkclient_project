//
//  Session.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 21.06.2021.
//

import Foundation
import UIKit


class Singleton {
    static let shared = Singleton()
    
    var session: URLSession!
    
    var token = ""
    var userId = ""
    var someLK = ""
    var realmSchemaNum: UInt64 = 11
    
    var listOfFriendsAvatars = [Int:UIImage?]()
    var listOfGroupsAvatars = [Int:UIImage?]()
    
    
    private init() {}
}

