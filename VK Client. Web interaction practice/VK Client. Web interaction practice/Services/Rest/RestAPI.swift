//
//  RestAPI.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 31.05.2022.
//

import Foundation
import Alamofire


class RestAPI {
    
    static let instance = RestAPI()
    private init(){}
    
    struct RestAPIConstants {
        
        static var urlRequest: URLRequest {
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                URLQueryItem(name: "client_id", value: "7888664"),
                URLQueryItem(name: "display", value: "mobile"),
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "scope", value: "offline,friends,photos,groups,notes,wall,newsfeed"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "v", value: "5.131")]
            
            let urlRequest = URLRequest(url: urlComponents.url!)
            return urlRequest
        }
    }
    
    func makeGetRequest(url: String, method: HTTPMethod = .get, params: Parameters? = nil, for user: UserAuthData) {
        let token = user.userToken
    }
}


