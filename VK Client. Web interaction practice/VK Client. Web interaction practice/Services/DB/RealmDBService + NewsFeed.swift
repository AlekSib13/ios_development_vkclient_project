//
//  RealmDBService + NewsFeed.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation

protocol NewsFeedDBManagerProtocol: BaseRealm {}


extension RealmDBManagerService: NewsFeedDBManagerProtocol {}
