//
//  Data+PrettyJson.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 21.07.2021.
//

import Foundation

extension Data {
    var prettyJson: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
              let prettyPrintedResult = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
              else {return nil}
        return prettyPrintedResult
    }
}
