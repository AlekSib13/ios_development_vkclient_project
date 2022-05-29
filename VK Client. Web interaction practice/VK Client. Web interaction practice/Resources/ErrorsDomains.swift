//
//  ErrorsDomains.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.05.2022.
//

import Foundation

enum AppErrors: Int, Error {
    static let description = "App Errors"
    
    case noUserWithCredentials = 0
    
    enum DBErros: String {
        case noUserWithCredentials = "There is no user in DB with indicated credentials"
    }
    
    func describeError() -> String {
        switch self.rawValue {
        case 0:
            return DBErros.noUserWithCredentials.rawValue
        default:
            return "Could not identify an error"
        }
    }
}
