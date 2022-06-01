//
//  RestAPI + Auth.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 31.05.2022.
//

import Foundation


protocol RestAPIAuth {
    func getAuthUrl() -> URLRequest
}


extension RestAPI: RestAPIAuth {
    func getAuthUrl() -> URLRequest {
        RestAPIConstants.urlRequest
    }
    
}
