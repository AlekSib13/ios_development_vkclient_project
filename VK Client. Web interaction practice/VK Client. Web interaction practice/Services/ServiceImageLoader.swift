//
//  ServiceImageLoader.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 15.08.2021.
//

import Foundation
import UIKit


protocol ImageLoaderProtocol {
    func downloadImage(imageLinks: [String], completion: ([UIImage]) -> Void)
}


class ImageLoader: ImageLoaderProtocol {
    func downloadImage(imageLinks: [String], completion: ([UIImage]) -> Void) {
        var listOfImages = [UIImage]()
        for link in imageLinks {
            if link == "-" {
                guard let image = UIImage(named: "no_img") else {return}
                listOfImages.append(image)
            } else {
                let imageURL = URL(string: link)
                guard let imageData = try? Data(contentsOf: imageURL!), let image = UIImage(data: imageData) else {
                    guard let image = UIImage(named: "no_img") else {return}
                    listOfImages.append(image)
                    continue
                }
                listOfImages.append(image)
            }
        }
        completion(listOfImages)
    }
}

