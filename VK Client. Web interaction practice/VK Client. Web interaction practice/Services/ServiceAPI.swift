//
//  DataService.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.06.2021.
//

import Foundation
import WebKit
import DynamicJSON
import Alamofire




protocol VKApiService {
    var schema: String {get}
    var host: String {get}
    var path: String {get}
}


class VKApiServiceParams: VKApiService {
    let schema: String
    let host: String
    let path: String
    let methodToPath: String
    
    
    init(schema: String, host: String, path: String, methodToPath: String) {
        self.schema = schema
        self.host = host
        self.path = path
        self.methodToPath = methodToPath
    }
}


protocol ServiceVKAPIExtendedProtocol {
    var schema: String {get}
    var host: String {get}
    var path: String {get}
    var userId: String {get}
    var token: String {get}
    var fields: String {get}
    var version: String {get}
    
    func getUserFriends(completion: @escaping ([Friend]) -> Void) -> Void
    func getUserGroups(completion: @escaping ([Group]) -> Void) -> Void
}


class ServiceVKAPIExtended: ServiceVKAPIExtendedProtocol {
    
    let schema = "https://"
    let host = "api.vk.com"
    let path = "/method"
    let userId = Singleton.shared.userId
    let token = Singleton.shared.token
    var fields = ""
    let version = "5.131"
    
    
    
    enum ApiMethods: String {
        case getUserFriends = "/friends.get"
        case getUserGroups = "/groups.get"
    }
    
    
    func getUserFriends(completion: @escaping ([Friend]) -> Void) {
        let method = ApiMethods.getUserFriends.rawValue
        fields = "domain,sex,bdate,city,photo_50,photo_100"
        let url = schema + host + path + method
        
        let params: Parameters = ["user_id": userId, "fields": fields, "access_token": token, "v": version]
        
        AF.request(url, method: .get, parameters: params).responseData{dataResponse in
            guard let data = dataResponse.data else {return}
            guard let items = JSON(data).response.items.array else {return}
            
            let friends: [Friend] = items.map{Friend(dataJSON: $0)}
            
            completion(friends)
        }
    }
    
    func getUserGroups(completion: @escaping ([Group]) -> Void) {
        let method = ApiMethods.getUserGroups.rawValue
        let url =  schema + host + path + method
        
        let params: Parameters = ["user_id": userId, "extended": 1 ,"access_token": token, "v": version]
        
        AF.request(url, method: .get, parameters: params).responseData{dataResponse in
            guard let data = dataResponse.data else {return}
            guard let items = JSON(data).response.items.array else {return}
            
            let groups: [Group] = items.map{Group(dataJSON: $0)}
            
            completion(groups)
        }
    }
}



